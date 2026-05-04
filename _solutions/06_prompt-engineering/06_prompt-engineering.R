library(ellmer)

# No special prompting
chat <- chat("anthropic/claude-sonnet-4-6")
chat$chat(
  "Interpret this plot.",
  content_image_file(
    here::here("_exercises/06_prompt-engineering/georgia-mortality-plot.png")
  )
)

# With a prompt file — here's an example for screen reader alt text
chat_alt <- chat(
  "anthropic/claude-sonnet-4-6",
  system_prompt = readr::read_file(
    here::here("_solutions/06_prompt-engineering/prompt.md")
  )
)
chat_alt$chat(
  "Interpret this plot.",
  content_image_file(
    here::here("_exercises/06_prompt-engineering/georgia-mortality-plot.png")
  )
)
