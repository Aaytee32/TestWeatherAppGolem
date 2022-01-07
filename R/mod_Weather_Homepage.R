#' Weather_Homepage UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#' 
#' @import shiny
#' @import shinydashboard
#'
#' @importFrom shiny NS tagList 
mod_Weather_Homepage_ui <- function(id){
  ns <- NS(id)
  
  source("www/weatherAPI.R")
  
  tagList(
      
      titlePanel(
        title = tags$link(rel = "icon", 
                          type = "image/gif",
                          href = "www/weather-icon.png"),
        "Weather App"
      ),
      
      includeCSS("www/styles.css"),
      
      tags$header( "My Weather App", 
                   id = "home_header"),
      
      actionButton("home_weather", "Home"),
      actionButton("home_about","About"),
      actionButton("home_help","Help"),
      
      
      div(
      column(width = 12,
      column(width = 7,
             textInput(inputId = ns("text"),
                  label = NULL, 
                  placeholder = "location")),
      column(width = 5,
             actionButton(inputId = ns("button"),
                          label = "Search"))),
        div(verbatimTextOutput(ns("display")), id = "display_p"), id ="Home_Div"),
      
      tags$footer(paste("Powered By OrximTech Microservices")))
 
}
    
#' Weather_Homepage Server Functions
#'
#' @noRd 
mod_Weather_Homepage_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    r <- reactiveValues(value = NULL)
    
    observeEvent(input$button,{
      if (input$button > 0){
        r$value <- 1
      }
    })
    
    observeEvent(input$text,{
      if (length(input$text) > 0){
        r$value <- 0
      }
    })
    
    observeEvent(r$value,{
      
      if (r$value == 1){
        shinyjs::show("display")
        
        output$display <- renderPrint({
          my_weather_app(input$text)
        })
      }
      
      else if (r$value == 0){
        shinyjs::hide("display")
        output$display <- renderPrint({
          return()
        })
      }
    })
 
  })
}
    
## To be copied in the UI
# mod_Weather_Homepage_ui("Weather_Homepage_ui_1")
    
## To be copied in the server
# mod_Weather_Homepage_server("Weather_Homepage_ui_1")
