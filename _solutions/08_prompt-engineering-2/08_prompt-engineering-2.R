library(ellmer)

# Without prompting — the model will likely hallucinate patterns
chat <- chat("anthropic/claude-sonnet-4-6")
chat$chat(
  "Interpret this plot.",
  content_image_file(
    here::here("_exercises/08_prompt-engineering-2/noise-plot.png")
  )
)

# With a skeptical prompt
chat_skeptical <- chat(
  "anthropic/claude-sonnet-4-6",
  system_prompt = paste(
    "You are a careful data analyst.",
    "When interpreting plots, check whether the data actually shows",
    "the patterns you'd expect given the axis labels.",
    "If the data looks suspicious, random, or inconsistent with the",
    "labels, say so clearly rather than inventing an interpretation."
  )
)
chat_skeptical$chat(
  "Interpret this plot.",
  content_image_file(
    here::here("_exercises/08_prompt-engineering-2/noise-plot.png")
  )
)
