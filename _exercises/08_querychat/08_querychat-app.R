# Load the Georgia mortality data and use querychat_app() to launch a querychat app
# for the Georgia mortality data
#
# then, experiment with the app: ask questions, run queries, etc.

library(querychat)

georgia_mortality <- readr::read_csv(
  here::here("data/georgia_mortality.csv"),
  show_col_types = FALSE
)

# Launch querychat with the georgia_mortality data
___
