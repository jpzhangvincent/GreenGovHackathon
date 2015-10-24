# server.R for the green gov shinyApps
library(shiny)
library(ggplot2)
library(plyr)
library(stringr)
library(rCharts)
library(rjson)
library(lattice)

load("data/building.rda")
load('data/co2e.rda') #load data frame co2 

shinyServer(function(input, output) {
  #CO2e
  output$DepartmentSelector <- renderUI ({
    selectizeInput("DepartmentSelectorUnit", "Select the Department: ",
                   choices = unique(co2$Organization.Name), selected = "Department of General Services")
  })
  
  DepartmentCore <- eventReactive(input$DepartmentButton, {
    department_names = unique(as.character(co2$Organization.Name))
    if(input$DepartmentSelectorUnit %in% department_names){
      mySubset = co2[co2$Organization.Name == input$DepartmentSelectorUnit, ]
      return(mySubset)
    }
    else{
      
    }
  })
  output$CO2Plot1 <- renderChart({
    mySubset = DepartmentCore()
    year = c(2010:2015)
    #value = as.integer(tapply(X = mySubset$Site.Energy.Use..kBtu., INDEX = mySubset$Year.Ending, FUN = sum, na.rm=TRUE))
    #value = c(NA, value, NA)
    tmp = data.frame(year, value = 1:6)
    p1 <- nPlot(CO2e ~ Emission.Year, data=mySubset, group = "Fuel.Type",
                type = "multiBarChart", dom="CO2Plot1")
    #p1$chart(forceY = c(0))
    p1$params$width = 500
    p1$params$height = 400
    return(p1)
  })
    
    # 
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