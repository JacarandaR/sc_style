library(DT)
library(kableExtra)
library(shiny)
library(shinyWidgets)
library(shinydashboard)
library(tidyverse)
library(bslib)
library(fresh)

my_theme <- create_theme(
  adminlte_color(
    light_blue = "#3aaa35"
  ),
  adminlte_sidebar(
    dark_bg = "#dce9dc",
    dark_hover_bg = "#d6e0d6",
    dark_hover_color = "#2E3440",
    dark_color = "#444444"
    # Sidebar text color
  ),
  adminlte_global(
    content_bg = "#f1f5f1",
    box_bg = "white",
    info_box_bg = "white"
  )
)



shinyApp(
  ui = tagList(
    tags$head(
      tags$style(
        HTML(
          ".irs--shiny .irs-bar, .irs--shiny .irs-single {border:  #3aaa35; background:  #3aaa35;}",
          "body, h2,p, .main-header .logo {color: #2E3440 ;}",
          ".sidebar {color: #2E3440 ;margin-left: 0px;}",
          ".left-side, .main-sidebar {padding-top: 70px;}",
          ".sidebar.shiny-bound-input{padding-top: 35px;}",
          ".navbar-nav{padding-top: 0px;}",
          ".skin-blue .main-header .logo {height: 70px;  display: inline-flex;align-items: center;}",
          ".sidebar-toggle {height: 70px;  display: inline-flex;align-items: center;}"
        )
      )
    ), dashboardPage(
      dashboardHeader(
        title = "Application title",
        tags$li(
          a(
            href = "https://www.sciensano.be/en",
            img(
              src = "SciensanoLOGO.png", height = "40px",
              title = "Sciensano Home"
            )
          ),
          class = "dropdown"
        )
      ),
      dashboardSidebar(
        sidebarMenu(
          menuItem("Pane1", tabName = "Pane1", icon = icon("dashboard")),
          menuItem("Pane2", tabName = "Pane2", icon = icon("th"))
        )
      ),
      dashboardBody(
        use_theme(my_theme),
        tabItems(
          tabItem(
            tabName = "Pane1",
            fluidRow(
              column(
                width = 3,
                box(
                  height = 600,
                  width = 13,
                  title = "Inputs",
                  status = "primary",
                  solidHeader = TRUE,
                  h1("Text"),
                  actionButton("button1", "Action button"),
                  sliderInput("slider", "Slider input:", 1, 100, 50),
                  textInput("text", "Text input:"),
                  shinyWidgets::pickerInput(
                    "choices",
                    "choices",
                    choices = unique(names(mtcars)),
                    selected = unique(names(mtcars)),
                    options = list("actions-box" = TRUE),
                    multiple = T
                  )
                )
              ),
              column(
                width = 9,
                box(
                  height = 600,
                  width = 13,
                  title = "Outputs",
                  status = "primary",
                  collapsible = TRUE,
                  dropdownButton(

                    tags$h3("List of Inputs"),
                    selectInput(
                      inputId = "xvar",
                      label = "X Variable",
                      choices = names(mtcars),
                      selected = names(mtcars)[[1]]
                    ),
                    selectInput(
                      inputId = "yvar",
                      label = "Y Variable",
                      choices = names(mtcars),
                      selected = names(mtcars)[[2]]
                    ),
                    circle = TRUE, status = "primary",
                    icon = icon("gear"), width = "300px",
                    tooltip = tooltipOptions(title = "Click to see inputs !")
                  ),
                  plotOutput("plot1", height = 500)
                )
              )
            ),
            fluidRow(
              column(
                width = 12,
                box(
                  height = 100,
                  width = 13,
                  textOutput("choices")
                )
              )
            )
          ),
          tabItem(
            tabName = "Pane2",
            tabsetPanel(
              tabPanel(title = tags$span(style = "color: #3aaa35;", "General overview")),
              tabPanel(
                title = tags$span(style = "color: #3aaa35;", "Tab 2"),
                tabBox(
                  title = tagList(shiny::icon("gear"), "Settings TabBox"),
                  side = "left", height = "250px",
                  selected = "Tab3",
                  tabPanel("Tab1", "Content for Tab One"),
                  tabPanel("Tab2", "Content for Tab Two"),
                  tabPanel("Tab3", "Content for Third Tab")
                )
              ),
              tabPanel(title = tags$span(style = "color: #3aaa35;", "Tab 3")),
              tabPanel(title = tags$span(style = "color: #3aaa35;", "Tab 4")),
            )
          )
        )
      )
    )
  ),
  server = function(input, output) {
    output$plot1 <- renderPlot({
      mtcars %>% ggplot() +
        aes_string(input$xvar, input$yvar) +
        geom_point()
    })
    output$choices <- renderText({
      paste("You have chosen", length(input$choices), "variables")
    })
  }
)
