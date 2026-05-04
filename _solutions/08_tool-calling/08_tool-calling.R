library(ellmer)
library(dplyr)

mortality <- readr::read_csv(
  here::here("data/georgia_mortality.csv"),
  show_col_types = FALSE
)

population <- readr::read_csv(
  here::here("data/georgia_population.csv"),
  show_col_types = FALSE
)

get_county_mortality <- function(county, year) {
  if (!county %in% mortality$County) {
    cli::cli_abort(glue::glue("{county} not found."))
  }

  mortality |>
    filter(County == county, Year == year) |>
    group_by(County, Site) |>
    summarize(deaths = sum(n)) |>
    left_join(
      population |> filter(County == county),
      by = "County"
    ) |>
    mutate(rate_per_100k = deaths / Population * 100000) |>
    arrange(desc(rate_per_100k))
}

county_mortality_tool <- tool(
  get_county_mortality,
  description = "Get cancer mortality data for a Georgia county, including deaths by site and per-capita rates.",
  arguments = list(
    county = type_string(
      "The county name, e.g. 'Fulton County'",
      required = TRUE
    ),
    year = type_integer(
      "The year of data to retrieve, e.g. 2021",
      required = TRUE
    )
  )
)

chat <- chat("anthropic/claude-sonnet-4-6")
chat$register_tool(county_mortality_tool)

chat$chat("Can you give me the mortality by site for Fulton County in 2021?")
