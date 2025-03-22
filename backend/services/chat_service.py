import openai
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Set the OpenAI API key
openai.api_key = os.getenv("OPENAI_API_KEY")


# Define a function to process the conversation and prompt
def process_conversation(prompt: str, conversation: str) -> str:
    # Combining the user conversation and the prompt to generate a more contextual response
    conversation_with_prompt = f"User: {conversation}\nBot: {prompt}"

    try:
        # Correct API call for the new OpenAI API client interface
        response = openai.chat.completions.create(
            model="gpt-3.5-turbo",  # or gpt-4 for GPT-4
            messages=[
                {"role": "user", "content": conversation_with_prompt},
            ],
            max_tokens=150,
            temperature=0.7,
        )

        # Return the response text from ChatGPT
        return response.choices[0].message.content.strip()

    except Exception as e:
        raise Exception(f"Error in OpenAI API request: {str(e)}")
