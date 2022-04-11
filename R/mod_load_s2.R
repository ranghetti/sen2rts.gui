#' loadS2 UI Function
#'
#' @description A shiny Module to load S2 archive to be used.
#'
#' @param id,input,output,session Internal parameters for `{shiny}`.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @importFrom sen2rts read_s2cube
#' @importFrom shinydashboard box
mod_loadS2_ui <- function(id, i18n){
  ns <- NS(id)
  tagList(
 
    fluidRow(

      column(
        width = 12,
        
        ## Set input sen2r archive
        box(
          title = ht("_title_s2input", i18n),
          width = 12,
          
          # Set input folder
          mod_showDir_ui(ns("showDir_S2input"), i18n = i18n),
          
          # Read cube
          actionButton(
            ns("load_S2input_btn"),
            strong(ph("\u2000",ht("_load_s2input", i18n))),
            icon=icon("upload")
          )#,

          ## Show statistics and options to filter by time window, orbit etc.
          # TODO

        ),
        
        ## Set input vector file
        box(
          title = ht("_title_insf", i18n),
          width = 12,
          
          ## Set input folder
          mod_showDir_ui(ns("showDir_S2input"), i18n = i18n),
        ),
        
        ## Confirm cube
        actionButton(
          ns("activate_gui_btn"),
          strong(ph("\u2000",ht("_activate_gui", i18n))),
          icon=icon("upload")
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

  
  ## Set input sen2r archive
  
  # Set input folder
  s2input_dir <- reactiveVal()
  callModule(mod_showDir_server, "showDir_S2input", i18n = i18n, volumes = volumes, path = s2input_dir)
  
  ## Read paths
  s2input_paths <- reactiveVal()
  observeEvent(input$load_S2input_btn, {
    s2input_paths(read_s2cube(s2input_dir()))
  })
  
  
  ## Set input vector file
  
  
  
  # ## Import raw TS
  # s2input_rawTS <- reactiveVal()
  # observeEvent(input$activate_gui_btn, {
  #   s2input_rawTS(extract_s2ts(s2input_paths()))
  # })
  
  
}
    
## To be copied in the UI
# mod_loadS2_ui("loadS2_ui_1")
    
## To be copied in the server
# callModule(mod_loadS2_server, "loadS2_ui_1")
 
