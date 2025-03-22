from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from services.chat_service import process_conversation

class ChatRequest(BaseModel):
    prompt: str
    conversation: str


class ChatResponse(BaseModel):
    response: str

# Initialize FastAPI router
router = APIRouter()


@router.post("/process-chat")
async def process_chat(request: ChatRequest):
    try:
        response = process_conversation(request.prompt, request.conversation)

        return response
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

