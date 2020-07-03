#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  
  # get server volumes
  volumes <- c("Home"=path.expand("~"), shinyFiles::getVolumes()())
  
  # Location of translations
  i18n <- suppressWarnings(
    Translator$new(translation_csvs_path = app_sys("app/translations"))
  )
  i18n$set_translation_language(getShinyOption("ui_lang", "en"))
  
  # List the first level callModules here
  callModule(mod_loadS2_server, "loadS2_1", i18n = i18n, volumes = volumes)
  
}
