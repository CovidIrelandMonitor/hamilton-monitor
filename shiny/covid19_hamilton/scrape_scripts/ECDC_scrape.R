# Scrape data from the European centre for disease control 
# taken from https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide

library(readxl)
library(httr)
library(tidyverse)
library(utils)

#create the URL where the dataset is stored with automatic updates every day
# url <- paste("https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-",format(Sys.time(), "%Y-%m-%d"), ".xlsx", sep = "")
# 
# #download the dataset from the website to a local temporary file
# GET(url, authenticate(":", ":", type="ntlm"), 
#     write_disk(tf <- tempfile(fileext = ".xlsx")))
# 
# #read the Dataset sheet into “R”
# ecdc_data <- try(read_excel(tf), silent = TRUE)
# 

# New version

#read the Dataset sheet into “R”. The dataset will be called "data".
ecdc_data <- try(read.csv("https://opendata.ecdc.europa.eu/covid19/casedistribution/csv/data.csv", 
                          na.strings = "", fileEncoding = "UTF-8-BOM"),
                 silent = TRUE)
ecdc_data$dateRep = as.Date(ecdc_data$dateRep, tryFormats = "%d/%m/%Y")
