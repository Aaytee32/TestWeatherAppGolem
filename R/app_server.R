#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyjs
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic

  shinyjs::hide("About")
  shinyjs::hide("Help")
  
  #################DYNAMIC UI############################ 
  output$Homepage <- renderUI({
    mod_Weather_Homepage_ui("Weather_Homepage_ui_1")
  })
  
  output$About <- renderUI({
    mod_Weather_About_ui("Weather_About_ui_1")
    })
  
  output$Help <- renderUI({
    mod_Weather_Help_ui("Weather_Help_ui_1")
  })
  
  observeEvent(input$home_about,{
    shinyjs::hide("Homepage")
    shinyjs::hide("Help")
    shinyjs::show("About")
  })
  
  observeEvent(input$help_about,{
    shinyjs::hide("Homepage")
    shinyjs::hide("Help")
    shinyjs::show("About")
  })
  
  observeEvent(input$help_weather,{
    shinyjs::show("Homepage")
    shinyjs::hide("About")
    shinyjs::hide("Help")
    
  })
  
  observeEvent(input$about_weather,{
    shinyjs::show("Homepage")
    shinyjs::hide("About")
    shinyjs::hide("Help")
  })
  
  observeEvent(input$home_help,{
    shinyjs::hide("Homepage")
    shinyjs::hide("About")
    shinyjs::show("Help")
  })
  
  observeEvent(input$about_help,{
    shinyjs::hide("Homepage")
    shinyjs::hide("About")
    shinyjs::show("Help")
  })
  
  
  ############################################################################
  mod_Weather_Homepage_server("Weather_Homepage_ui_1")
}
