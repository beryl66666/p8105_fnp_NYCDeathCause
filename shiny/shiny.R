
library(flexdashboard)
library(shiny)
library(tidyverse)
library(viridis)
library(plotly)

nypd_complaint = 
  read_csv("./data/nypd_complaint_two_year_data.csv")

complaint_select=nypd_complaint %>% 
  janitor::clean_names() %>% 
  select(month,day,year,ofns_desc,susp_sex,susp_race,susp_age_group,latitude,longitude,vic_race,vic_sex,vic_age_group) %>% 
  drop_na(susp_sex,susp_race,susp_age_group,vic_race,vic_sex,vic_age_group)%>% 
  mutate(
    date=str_c(year,month,day, sep = "-"),
    location=str_c(longitude,latitude,sep=", "))
complaint_select

ui= dashboardPage(
  dashboardHeader(title = "NYPD Complaints During The Pandemic")