library(shiny)
library(readr)

source("modules/data_page.R")

main <- function() {
  ui <- navbarPage(
    title = "HyperOpus v1.0.0",
    tabPanel("Data",data_page_ui("data")),
    tabPanel("Analysis", ""),
    tabPanel("Workflows", "")
  )
  server <- function(input, output, session) {
    data_page_server("data")
  }
  shinyApp(ui,server)
}

main()