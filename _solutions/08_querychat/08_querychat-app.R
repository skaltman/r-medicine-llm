library(querychat)

health_exp <- readr::read_csv(
  here::here("data/health-expenditure.csv")
)

querychat_app(health_exp)
