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
          title = strong("Tab 1"),
          fluidRow(
            tabBox(
              width = 12,
              tabPanel(
                title = strong("Tab 1.1"),
                column(width=3),
                column(width=9)
              )
            )
          )
        )} # this is the first tab.
      )
    }) # this divides the entire visualization top level parallel tabs
  )
)