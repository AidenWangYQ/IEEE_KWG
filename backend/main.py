from fastapi import FastAPI
# from routes.chat import router as chat_router
import openai # Remeber to use the latest version
import uuid
import asyncio

app = FastAPI()
# app.include_router(chat_router)

# X.X Forget all the coding conventions, its a hackathon and we are in hurry man
# No time for REDIS, a dict is enough
MEMORY_DB = {}

# Recording class, including the recording id, number of slices, and the Slice class list
class Recording:
    def __init__(self, recording_id):
        self.recording_id = recording_id
        self.slices = 0
        self.slice_list = []
        self.finished = False
        self.processing = False
        self.processed = False
        self.full_text = ""
        self.full_summary = ""
        self.options = {
            "chosen": False,
            "options": []
        }
        

# Slice class, including the b64encoded audio file, text & summary
class Slice:
    def __init__(self, recording_id, slice_number, b64audio, text, summary):
        self.recording_id = recording_id
        self.slice_number = slice_number
        self.b64audio = b64audio
        self.text = text
        self.summary = summary
        self.processing = False
        self.processed = False
    # str
    def __str__(self):
        if self.processed:
            return"Slice: {self.recording_id} #{self.slice_number}, NOT PROCESSED" 
        else: 
            return "Slice: {self.recording_id} #{self.slice_number}, PROCESSED, Text: {self.text}, Summary: {self.summary}"

# 1. When user starts a recording, request GET /startRecording , backend assign a recording id saved in memory database. Backend return recording id
@app.get("/startRecording")
def start_recording():
    recording_id = str(uuid.uuid4())
    MEMORY_DB[recording_id] = Recording(recording_id)
    return {"recording_id": recording_id}

# 2. Everytime user hits flag button, base64 encode and send the recording slice (from the beginning or previous flag) to backend POST /saveFlag with recording id
# Backend now send the slice for speech2text together with the summary from the previous slices as prompt input to get the summary for this slice
@app.post("/saveFlag")
def save_flag(recording_id: str, b64audio: str):
    recording = MEMORY_DB[recording_id]
    recording.slice_list.append(Slice(recording_id, recording.slices, b64audio, "", ""))
    recording.slices += 1
    asyncio.run(process_slice(recording.slice_list[-1]))
    return {"status": "success"}

async def process_slice(slice):
    # TODO: Implement the OpenAI
    # STT, Summarization
    if slice.processing:
        print("Slice is under processing: ", slice)
        return
    slice.processing = True
    print("Processing slice: ", slice)
    await asyncio.sleep(1)
    await ai_speech2text(slice)
    await ai_summarize(slice)
    slice.processing = False
    slice.processed = True
    print("Processed slice: ", slice)

async def ai_speech2text(slice):
    await asyncio.sleep(2)
    # TODO: Fake data! Implement real STT with OpenAI
    slice.text = "This is the text supposed to be returned by the speech to text api"

async def ai_summarize(slice):
    await asyncio.sleep(2)
    # TODO: Fake data! Implement real Summarization with OpenAI
    slice.summary = "This is the summary"

# 3. When ending recording, POST /endRecording with the audio file from the last checkpoint till the end
# Server speech2text & generate summary, concate all speech2text and insert all checkpoint summary
@app.post("/endRecording")
def end_recording(recording_id: str, b64audio: str):
    recording = MEMORY_DB[recording_id]
    recording.slice_list.append(Slice(recording_id, recording.slices, b64audio, "", ""))
    recording.slices += 1
    asyncio.run(process_recording(recording))
    return {"status": "success"}

async def process_recording(recording):
    if recording.processing:
        print("Recording is under processing: ", recording)
        return
    for slice in recording.slice_list:
        if not slice.processed and not slice.processing:
            await process_slice(slice)
    # Wait for all slices to be processed
    while not all(slice.processed for slice in recording.slice_list):
        await asyncio.sleep(1)
    print("All slices processed for recording: ", recording)
    recording.processing = True
    recording.finished = True
    # Concatenate all text
    recording.full_text = concatenate_text(recording)
    await ai_generate_full_summary(recording)
    await ai_generate_options(recording)
    recording.processing = False
    recording.processed = True

def concatenate_text(recording):
    result = "[Start of recording]"
    for slice in recording.slice_list:
        result += f"[Start of slice {slice.slice_number}]{slice.text}[End of slice {slice.slice_number}][Summary of slice {slice.slice_number}: {slice.summary}]"
    result += "[End of recording]"
    return result

def ai_generate_full_summary(recording):
    # TODO: Implement the OpenAI
    return "This is supposed to be the full summary"

def ai_generate_options(recording):
    # TODO: Implement the OpenAI
    return ["These are supposed to be the options (1)", "These are supposed to be the options (2)", "These are supposed to be the options (3)"]

@app.get("/")
def index():
    return "Running"
