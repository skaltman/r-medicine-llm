library(querychat)

georgia_mortality <- readr::read_csv(
  here::here("data/georgia_mortality.csv"),
  show_col_types = FALSE
)

querychat_app(georgia_mortality)
