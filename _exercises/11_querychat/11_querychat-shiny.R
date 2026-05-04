# ── Your Turn: Add querychat to a Shiny app ──────────────────────────
#
# querychat_app() is great for quick exploration, but you can also
# embed querychat into your own Shiny app. This gives you control
# over the layout and lets you use the filtered data in your own
# outputs (tables, plots, etc.).
#
# STEP 1: Create a QueryChat object from the dataset
# STEP 2: Add the chat sidebar to the UI
# STEP 3: Connect the server and use the filtered data

library(shiny)
library(bslib)
library(querychat)
library(reactable)

georgia_mortality <- readr::read_csv(
  here::here("data/georgia_mortality.csv"),
  show_col_types = FALSE
)

# STEP 1: Create a QueryChat object
qc <- QueryChat$new(georgia_mortality)

ui <- page_sidebar(
  title = "Georgia Mortality Explorer",
  # STEP 2: Add the querychat sidebar
  sidebar = ____,
  card(
    card_header(textOutput("title")),
    reactableOutput("table")
  )
)

server <- function(input, output, session) {
  # STEP 3: Connect the querychat server
  qc_vals <- ____

  output$title <- renderText(qc_vals$title())

  output$table <- renderReactable({
    reactable(qc_vals$df(), defaultPageSize = 15)
  })
}

shinyApp(ui, server)
