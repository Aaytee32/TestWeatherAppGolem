#' Weather_About UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Weather_About_ui <- function(id){
  ns <- NS(id)
  tagList(
     
      includeCSS("www/styles.css"),
      
      tags$header( "About OrximTech", 
                   id = "about_header"),
      
      actionButton("about_weather", "Home"),
      actionButton("about_about","About"),
      actionButton("about_help","Help"),
      
      div(p("This Weather App was created by Anthony Oppong-Gyebi, 
              the Founder and COO of OrximTech Microservices Inc."),
                p("This App uses MapBox and Weatherstack to fetch weather information based on specified geolocation."), id ="About_Div"),
      
      tags$footer(paste("Powered By OrximTech Microservices")))
 
}
    
#' Weather_About Server Functions
#'
#' @noRd 
mod_Weather_About_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_Weather_About_ui("Weather_About_ui_1")
    
## To be copied in the server
# mod_Weather_About_server("Weather_About_ui_1")
