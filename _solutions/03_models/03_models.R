library(ellmer)

# Step 1: List available models for OpenAI and Anthropic
# List models using the `models_*()` functions.
models_anthropic()
models_openai()

# Feel free to change the prompt!
prompt <- "Write some code to generate a synthetic dataset in R."

# Step 2: Compare responses from different models
# Try sending the same prompt to different models to compare the responses.
chat1 <- chat("openai/gpt-5.5")
chat1$chat(prompt)

chat2 <- chat("anthropic/claude-opus-4-7")
chat2$chat(prompt)
