library(ellmer)

# 1. Create a chat with a system prompt instructing the model to answer briefly.
chat <- chat(
  name = "anthropic/claude-opus-4-7",
  system_prompt = "Answer in as few words as possible."
)

# 2. Ask the first question:
chat$chat("What ellmer function tells me what Anthropic models are available?")

# 3. Ask the second question:
chat$chat("What about OpenAI models?")

# 4. Create a new chat with no system prompt and ask the second question again.
chat2 <- chat(name = "anthropic/claude-opus-4-7")
chat2$chat("What about OpenAI models?")

# 5. How do the answers to 3 and 4 differ?
# - chat$chat() answers briefly (system prompt still active) and in context
#   (it knows you were asking about ellmer functions).
# - chat2$chat() gives a longer answer (no brevity instruction) and has no
#   context about ellmer — it may talk about OpenAI models in general.
