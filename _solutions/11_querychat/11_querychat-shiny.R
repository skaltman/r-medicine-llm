library(shiny)
library(bslib)
library(querychat)
library(reactable)

georgia_mortality <- readr::read_csv(
  here::here("data/georgia_mortality.csv"),
  show_col_types = FALSE
)

qc <- QueryChat$new(georgia_mortality)

ui <- page_sidebar(
  title = "Georgia Mortality Explorer",
  sidebar = qc$sidebar(),
  card(
    card_header(textOutput("title")),
    reactableOutput("table")
  )
)

server <- function(input, output, session) {
  qc_vals <- qc$server()

  output$title <- renderText(qc_vals$title())

  output$table <- renderReactable({
    reactable(qc_vals$df(), defaultPageSize = 15)
  })
}

shinyApp(ui, server)
