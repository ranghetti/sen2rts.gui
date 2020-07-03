#' loadS2 UI Function
#'
#' @description A shiny Module to load S2 archive to be used.
#'
#' @param id,input,output,session Internal parameters for `{shiny}`.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom shinydashboard box
mod_loadS2_ui <- function(id, i18n){
  ns <- NS(id)
  tagList(
 
    fluidRow(
      #  ----
      column(
        width = 12,
          div(
            #  ---
            box(
              title = "prova",
              width = 12,
              
              mod_showDir_ui(ns("showDir_S2input"), i18n = i18n)


            )
          )
      )
    )
              
  )
}
    
#' loadS2 Server Function
#'
#' @noRd 
mod_loadS2_server <- function(input, output, session, i18n, volumes){
  ns <- session$ns

  s2input_path <- reactiveVal()
  callModule(mod_showDir_server, "showDir_S2input", i18n = i18n, volumes = volumes, path = s2input_path)
  
}
    
## To be copied in the UI
# mod_loadS2_ui("loadS2_ui_1")
    
## To be copied in the server
# callModule(mod_loadS2_server, "loadS2_ui_1")
 
