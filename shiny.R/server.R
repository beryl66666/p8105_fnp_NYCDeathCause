library(flexdashboard)
library(shiny)
library(tidyverse)
library(viridis)
library(plotly)

server = function(input, output) {
  
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
