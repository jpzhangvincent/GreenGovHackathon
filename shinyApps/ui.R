# ui.R for green gov shinyApp
library(shiny)
library(shinydashboard)
library(rCharts)
library(graphics)

dashboardPage(
  
  dashboardHeader(),
  
  dashboardSidebar(
    absolutePanel(
      class = "main-sidebar",
      strong(h1("Version 1.1"))
    )
  ),
  
  dashboardBody(
    fluidRow({
      column(
        width = 12,
        h1("Welcome to PROTOTYPE Green Gov Information Dashboard!", align = "center"),
        h4("Here, you will find information about XXX", align = "center")
      )
    }), #this row is the title
    
    fluidRow({
      tabBox(
        width = 12,
        
        {tabPanel(
          title = strong("Welcome"),
          img(src='logo.jpg', width=500, align = "right"),
          h4("Insert introduction here"),
          HTML("<font size='4'>Contact: <br>Member1 <br>Member2 <br>Member3 <br>Member4<br></font>")
          )}, # this is the welcome tab. 
        
        {tabPanel(
          title = strong("CO2e"),
          fluidRow(
            tabBox(
              width = 12,
              tabPanel(
                title = strong("Emission by type"),
                column(
                  width=3,
                  uiOutput("DepartmentSelector"),
                  helpText("You can select a department for CO2 emission."),
                  actionButton("DepartmentButton","See Visualization!")
                ),
                column(
                  width=9,
                  showOutput("CO2Plot1", "nvd3")
                )
              )
            )
          )
        )}, # this is the CO2e tab.
        
        {tabPanel(
          title = strong("State Buildings Energy Use"),
          fluidRow(
            tabBox(
              width = 12,
              tabPanel(
                title = strong("Tab 1.1"),
                column(
                  width=3,
                  uiOutput("buildingBasicUnitSelector"),
                  helpText("You can select an individual building or an entire department."),
                  actionButton("buildingBasicUnitButton","See Visualization!")
                ),
                column(
                  width=9,
                  showOutput("buildingPlot1", "nvd3")
                )
              )
            )
          )
        )}, # this is the building tab.
        
        {tabPanel(
          title = strong("Fleet Program"),
          fluidRow(
            tabBox(
              width = 12,
              tabPanel(
                title = strong("Tab 1.1"),
                column(
                  width=3
                ),
                column(
                  width=9
                )
              )
            )
          )
        )}, # this is the fleet tab.
        
        {tabPanel(
          title = strong("Waste Management"),
          fluidRow(
            tabBox(
              width = 12,
              tabPanel(
                title = strong("Tab 1.1"),
                column(
                  width=3
                ),
                column(
                  width=9
                )
              )
            )
          )
        )} # this is the waste management tab.
      )
    }) # this divides the entire visualization top level parallel tabs
  )
)