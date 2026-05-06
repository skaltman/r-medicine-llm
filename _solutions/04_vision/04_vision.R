library(ellmer)

chat <- chat("anthropic/claude-haiku-4-5")
chat$chat(
  "Describe what this plot shows.",
  content_image_file(
    here::here("_exercises/04_vision/health-expenditure-preventive.png")
  )
)

chat2 <- chat("anthropic/claude-haiku-4-5")
chat2$chat(
  "What trends do you notice in this visualization?",
  content_image_file(
    here::here("_exercises/04_vision/health-expenditure-curative-comparison.png")
  )
)
