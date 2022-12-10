library(flexdashboard)
library(shiny)
library(tidyverse)
library(viridis)
library(plotly)

nypd_complaint = 
  read_csv("./shiny/nypd_complaint_two_year_data.csv")

complaint_select=nypd_complaint %>% 
  janitor::clean_names() %>% 
  select(month,day,year,ofns_desc,susp_sex,susp_race,susp_age_group,latitude,longitude,vic_race,vic_sex,vic_age_group) %>% 
  drop_na(susp_sex,susp_race,susp_age_group,vic_race,vic_sex,vic_age_group)%>% 
  mutate(
    date=str_c(year,month,day, sep = "-"),
    location=str_c(longitude,latitude,sep=", "))

crime_type=complaint_select %>% 
group_by(ofns_desc,year) %>% 
  summarise(obs=n()) %>% 
  filter(obs>5000)

complaint_select

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

server = function(input, output) {
  histdata <- rnorm(500)
  
  output$plot1 = renderPlot({
    data = histdata[seq_len(input$slider)]
    hist(data)
  })
}

output$value = renderPrint({ input$Crime_Type })

shinyApp(ui, server)
