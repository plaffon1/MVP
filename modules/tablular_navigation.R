library(shiny)
library("reactable")

reactable_aesthetics <- colDef(
  align = "center",
  minWidth = 68,
  headerStyle = "#f5f7f8",
)

tabular_navigation_ui <- function(id) {
  tagList(
    reactableOutput(NS(id, "table"))
  )
}

#takes the path to a CSV file that will serve as the index of the table
# click logic (javascript) passed into JS() on bottom button click
tabular_navigation_server <- function(id, csv_path) {
  index_df <- reactive(read_csv(csv_path))
  moduleServer(id, function(input, output, session) {
    output$table <- renderReactable({
      reactable(
        index_df(),
        defaultColDef = reactable_aesthetics,
        selection = "multiple",
        onClick = "select",
        bordered = TRUE,
        highlight = TRUE,
        filterable = TRUE,
      )
    })
  }

  )
}

tabular_navigation_app <- function() {
  ui <- fluidPage(
    tabular_navigation_ui("for_testing")
  )

  server <- function(input, output, session) {
    tabular_navigation_server(id = "for_testing",
                              csv_path = "ui_data/database_index.csv")

  }

  shinyApp(ui, server)
}

tabular_navigation_app()
