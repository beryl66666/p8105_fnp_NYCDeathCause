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

function(input, output) {
  
  output$plot1 = renderPlotly({
    complaint_select %>% 
      mutate(text_label = str_c("Crime: ", ofns_desc, '\nDate: ', date)) %>% 
      plot_ly(
        x = ~longitude, y = ~latitude, type = "scatter", mode = "markers",
        alpha = 0.5, color = ~ofns_desc, text = ~text_label)
  })
  
  output$value = renderPrint({ input$Crime_Type })
}



shinyApp(ui, server)
