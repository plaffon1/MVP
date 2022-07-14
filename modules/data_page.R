library(shiny)
source("modules/tablular_navigation.R")

data_page_ui <- function(id) {
  tagList(
    navlistPanel(
      "Libraries",
      tabPanel("Datasets"),
      tabPanel("Databases",
               tabular_navigation_ui(NS(id,"database"))),
      "Tools",
      tabPanel("Transform"),
      tabPanel("Query"),
      "Import",
      tabPanel("Upload Data"),
      tabPanel("Create Database"),
      widths = c(2, 10)
    )
  )
}

data_page_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    tabular_navigation_server(
      id = "database",
      csv_path = "ui_data/database_index.csv")
  })
}

data_page_test <- function() {
  ui <- fluidPage(data_page_ui("for testing"))
  server <- function(input, output, session) data_page_server("for testing")
  shinyApp(ui, server)
}

data_page_test()
