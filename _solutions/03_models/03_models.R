library(ellmer)

# List models using the `models_*()` functions.
# Hint: try using the Positron data viewer by calling `View()` on the results.
models_openai() # openai/gpt-5.4-nano
models_anthropic() # anthropic/claude-haiku-4-5-20251001
models_ollama() # ollama/gemma3:8b

prompt <- "Write a  recipe for an easy weeknight dinner my kids would like."

# Try sending the same prompt to different models to compare the responses.
chat("openai/gpt-5.4")$chat(prompt)
chat("anthropic/claude-sonnet-4-6")$chat(prompt)

# If you have local models installed, you can use them too.
chat("ollama/gemma3:4b")$chat(prompt)

# Instead of `chat()`, you can also use direct provider functions:
chat_openai(model = "gpt-5.4")
chat_anthropic(model = "claude-sonnet-4-6")
chat_ollama(model = "gemma3:4b")
