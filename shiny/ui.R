library(flexdashboard)
library(shiny)
library(tidyverse)
library(viridis)
library(plotly)

ui = dashboardPage(
  dashboardHeader(title ="NYPD Complaints During The Pandemic"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th")),
      #dateRangeInput
      dateRangeInput("dates", 
                     label = h3("Date Range"),
                     start = "2020-1-1",
                     end   = "2021-9-9",
                     format = "mm/dd/yy",
                     separator = " - "),
      #sliderInput
      min_longitude=complaint_select %>% distinct(longitude) %>% min(),
      max_longitude=complaint_select %>% distinct(longitude) %>% max(),
      sliderInput("longitude", 
                  label = h3("Longitude"), 
                  min = min_longitude, 
                  max = max_longitude 
      ),
      #sliderInput
      min_latitude=complaint_select %>% distinct(latitude) %>% min(),
      max_latitude=complaint_select %>% distinct(latitude) %>% max(),
      sliderInput("latitude", 
                  label = h3("Latitude"), 
                  min = min_latitude, 
                  max = max_latitude
      ),
      #checkboxInput
      checkboxGroupInput("Crime_Type", 
                         label = h3("Crime Type"), 
                         choices = list("ASSAULT 3 & RELATED OFFENSES" = 1, 
                                        "CRIMINAL MISCHIEF & RELATED OF" = 2, 
                                        "GRAND LARCENY" = 3,
                                        "HARRASSMENT 2" =4,
                                        "PETIT LARCENY"=5
                         ),
                         selected = 1),
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
    )
  )
)


