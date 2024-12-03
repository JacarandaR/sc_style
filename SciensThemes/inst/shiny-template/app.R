library(DT)
library(kableExtra)
library(shiny)
library(shinyWidgets)
library(survey)
library(tidyverse)
library(bslib)


# Define UI
ui <- tagList(
  tags$head(
    tags$style(
      HTML(
        ".navbar { background-color: #3aaa35 !important; height: 60px !important; }",
        ".navbar { background-color: #3aaa35 !important; }",
        ".nav.navbar-nav { justify-content: center; }",
        ".nav.navbar-nav > .active > a { background-color: #2E7D32 !important; border-color: transparent !important; }",
        ".nav.navbar-nav > .active > a:hover { background-color: #388E3C !important; border-color: transparent !important; }",
        ".nav.navbar-nav > li > a {
          padding: 10px 20px;
          border: 1px solid transparent;
          border-radius: 10px;
          background-color: #4fba4a;
          color: white !important;
          margin-right: 5px;
          line-height: 34px;}",
        ".nav.navbar-nav > li > a:hover {
          background-color: #388E3C;
        }",
        ".nav.navbar-nav > .active > a,
        .nav.navbar-nav > .active > a:hover,
        .nav.navbar-nav > .active > a:focus {
          background-color: #2E7D32 !important;
          border-color: transparent !important;
        }"
      )
    )
  ),
  navbarPage(
    title = div(
      style = "display: flex; align-items: center;justify-content: center;width: 100%",
      tags$img(src = "SciensanoLOGO2.png", height = "36px", style = "margin-right: 10px;"),
      tags$li(
        HTML(
          "<style>.navbar-brand {color: white !important; font-size: 26px !important; text-decoration: none !important; }</style>"
        ),
        style = "list-style: none;",
        "Application title"
      )
    ),
    tabPanel(
      "Tab1",
      icon = icon("table"),
      # Sidebar with a slider input for number of bins
      sidebarLayout(
        sidebarPanel(
          selectInput("indicator",
                      "First select an indicator",
                      choices = c(1, 2, 3)
          )
        ),
        mainPanel()
      )
    ),

    tabPanel(
      "Plots",
      icon = icon("chart-simple", "fa"),

      #
      # Panel content
      #

    ),
    tabPanel(
      "Data",
      icon = icon("database", "fa"),
    ),
  )
)


# Define server logic
server <- function(input, output, session) {


}

# Run the application
shinyApp(ui = ui, server = server)
