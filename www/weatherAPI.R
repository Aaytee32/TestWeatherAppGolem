if (!require (jsonlite)) install.packages("jsonlite")
library(jsonlite)
if (!require (httr)) install.packages("httr")
library(httr)
library(dplyr)

my_weather_app <- function(address){
##########################GETTING COORDINATES FROM ADDRESS#####################
geocode <- function(address){
  
    url_comp = c('https://api.mapbox.com/geocoding/v5/mapbox.places/',
                 encodeString(address),
                 '.json?access_token=pk.eyJ1IjoiYWF5dGVlMzIiLCJhIjoiY2t3MXB3eG15MXltcTJudDN2OXhxemhqYSJ9.SipuGKxhQ5eleRoqmNiaZQ&limit=1')
    
    url = paste(url_comp,collapse = "")
    
    url_res <- GET(url)
    text_content <- content(url_res, "text", encoding = "UTF-8")
    json_content <- text_content %>% fromJSON
    addr_coord <- json_content$features$center
    addr_latitude <- as.numeric(as.data.frame(addr_coord)[2,1])
    addr_longitude <- as.numeric(as.data.frame(addr_coord)[1,1])
    addr_location <- json_content$features$place_name
    
    geocode_output <- list("Location" = addr_location, 
                           "Latitude" = addr_latitude, 
                           "Longitude" = addr_longitude)
    geocode_output
}

Location <- geocode(address)$Location

#########################GETTING WEATHER INFORMATION############################
weather_forecast <- function(address){
  Area_geocode <- geocode(address)
  latitude <- Area_geocode$Latitude
  longitude <- Area_geocode$Longitude
  
  url_comp = c("http://api.weatherstack.com/current?access_key=aef2e52bc8ac14b64e2ad52b303745f3&query=",
  latitude,",",
  longitude)
  
  url = paste(url_comp, collapse = "")
  
  url_res <- GET(url)
  text_content <- content(url_res, "text", encoding = "UTF-8")
  json_content <- text_content %>% fromJSON
  #json_content
  
  weather_temp <- json_content$current$temperature
  weather_desc <- json_content$current$weather_descriptions
  weather_precip <- json_content$current$precip
  weather_humid <- json_content$current$humidity
  weather_feelslike <- json_content$current$feelslike
  temp_fahr <- 9*weather_temp/5 + 32
  temp_feelslike <- 9*weather_feelslike/5 + 32
  forecast_output <- list("Temperature" = temp_fahr,
                          "Weather_Description" = weather_desc,
                          "Precipitation" = weather_precip,
                          "Humidity" = weather_humid,
                          "Current_Feel" = temp_feelslike)
  forecast_output

}

#########################DISPLAY WEATHER INFORMATION############################
display_weather_info <- function(address){
  
  Area_weather <- weather_forecast(address)
  
  paste(Area_weather$Weather_Description, 
        "; The temperature is currently", Area_weather$Temperature, "degrees fahrenheit;","\n",
        "It feels like", Area_weather$Current_Feel, " degrees fahrenheit with a humidity of","\n",
        Area_weather$Humidity, "percent and", Area_weather$Precipitation, "percent chance of rain!")
}

cat(Location, "\n")

cat("\n", display_weather_info(address))
}

my_weather_app(address = "Boston")


