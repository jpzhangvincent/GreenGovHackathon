# server.R for the green gov shinyApps
library(shiny)
library(ggplot2)
library(plyr)
library(stringr)
library(rCharts)
library(rjson)
library(lattice)

load("data/building.rda")

shinyServer(function(input, output) {
  output$buildingBasicUnitSelector <- renderUI ({
    selectizeInput("buildingBasicUnit", "Select the Property: ",
                   choices = c(unique(as.character(building$Department.Name)), unique(as.character(building$Property.Name))), selected = "Department of General Services")
  })
  
  buildingBasicUnitCore <- eventReactive(input$buildingBasicUnitButton, {
    department_names = unique(as.character(building$Department.Name))
    if(input$buildingBasicUnit %in% department_names){
      mySubset = building[building$Department.Name == input$buildingBasicUnit, ]
      return(mySubset)
    }
    else{
      
    }
  })
  output$buildingPlot1 <- renderChart({
    mySubset = buildingBasicUnitCore()
    year = c(2012:2015)
    value = as.integer(tapply(X = mySubset$Site.Energy.Use..kBtu., INDEX = mySubset$Year.Ending, FUN = sum, na.rm=TRUE))
    value = c(NA, value, NA)
    tmp = data.frame(year, value)
    p1 <- nPlot(value ~ year, data=tmp, type = 'lineChart', dom="buildingPlot1")
    p1$chart(forceY = c(0))
    return(p1)
  })
  
  
})