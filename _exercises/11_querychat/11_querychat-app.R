# ── Your Turn: querychat ──────────────────────────────────────────────
#
# querychat lets you explore data using natural language.
# The LLM writes SQL queries, and a database executes them —
# so results are reliable (no hallucinations!).
#
# STEP 1: Run this script to launch querychat_app() and explore the
#         Georgia mortality dataset with natural language.
#
# STEP 2: Try asking questions like:
#         - "Which county had the most cancer deaths in 2023?"
#         - "Show me total deaths by cancer site for Fulton County"
#         - "Compare death counts between males and females"

library(querychat)

georgia_mortality <- readr::read_csv(
  here::here("data/georgia_mortality.csv"),
  show_col_types = FALSE
)

querychat_app(georgia_mortality)
