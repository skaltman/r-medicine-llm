library(ellmer)
library(dplyr)

health_exp <- readr::read_csv(
  here::here("data/health-expenditure.csv"),
  show_col_types = FALSE
)

get_country_spending <- function(country, year_) {
  if (!country %in% health_exp$country_name) {
    cli::cli_abort(glue::glue("{country} not found."))
  }

  health_exp |>
    filter(country_name == country, year == year_) |>
    select(spending_purpose, pct_current_health_exp, usd_2023) |>
    arrange(desc(usd_2023))
}

country_spending_tool <- tool(
  get_country_spending,
  description = "Get health expenditure data for a country and year, showing spending by purpose as percentage of current health expenditure and in constant 2023 USD.",
  arguments = list(
    country = type_string(
      "The country name, e.g. 'Japan'",
      required = TRUE
    ),
    year = type_integer(
      "The year of data to retrieve, e.g. 2020",
      required = TRUE
    )
  )
)

chat <- chat("anthropic/claude-sonnet-4-6")
chat$register_tool(country_spending_tool)

chat$chat("What did Japan spend on preventive care in 2020?")
