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

# Step 1: Write a function that takes a county name and year and returns a
# summary of mortality data for that county and year. It should:
# - Filter the mortality data for the given county and year
# - Summarize total deaths by site
# - Optionally, incorporate population data
get_county_mortality <- function(county, year) {
  mortality |>
    filter(____) |>
    ____
}

# Step 2: Define a tool using tool() that wraps your function.
# Give it a description and specify the arguments.
# Look at the tool() documentation if you need help.
county_mortality_tool <- tool(
  ___,
  ___,
  ___
)

# Step 3: Create a chat and register the tool.
chat <- chat("anthropic/claude-sonnet-4-6")
___

# Step 4: Try asking the model about mortality for a specific county and year
chat$chat("Can you give me the mortality by site for Fulton County in 2021?")
