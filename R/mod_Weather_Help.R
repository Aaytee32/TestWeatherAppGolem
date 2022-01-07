#' Weather_Help UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Weather_Help_ui <- function(id){
  ns <- NS(id)
  tagList(
    includeCSS("www/styles.css"),
    
    tags$header( "Help", 
                 id = "help_header"),
    
    actionButton("help_weather", "Home"),
    actionButton("help_about","About"),
    actionButton("help_help","Help"),
    
    div(p("Feel free to ask questions"), id = "Help_Div"),
    
    tags$footer(paste("Powered By OrximTech Microservices")))
}
    
#' Weather_Help Server Functions
#'
#' @noRd 
mod_Weather_Help_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_Weather_Help_ui("Weather_Help_ui_1")
    
## To be copied in the server
# mod_Weather_Help_server("Weather_Help_ui_1")
