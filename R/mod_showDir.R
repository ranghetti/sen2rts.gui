#' showDir UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for `{shiny}`.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_showDir_ui <- function(id, i18n){
  ns <- NS(id)
  tagList(
    div(
      style="vertical-align:top;",
      shiny::div(
        style = "display:inline-block;vertical-align:top;width:85pt;padding-top:8px;",
        shiny::strong(ht("_showDir_label", i18n))
      ),
      shiny::div(
        style = "display:inline-block;vertical-align:top;width:calc(100% - 85pt - 50pt - 15px - 10pt - 10px);",
        shiny::textInput(ns("path_textin"), NULL, "", width = "100%")
      ),
      shiny::div(
        style = "display:inline-block;vertical-align:top;width:50pt;",
        shinyFiles::shinyDirButton(
          ns("path_shf"), ht("_showDir_button", i18n),
          ht("_showDir_sfb", i18n)
        )
      ),
      shiny::div(
        style = "display:inline-block;vertical-align:top;width:15px;margin-left:10pt;padding-top:8px;",
        shiny::htmlOutput(ns("path_errormess"))
      )
    )
  )
}
    
#' showDir Server Function
#'
#' @noRd 
mod_showDir_server <- function(input, output, session, i18n, volumes, path){
  ns <- session$ns

  ## Observer for shinyfiles
  shinyFiles::shinyDirChoose(input, "path_shf", roots = volumes)
  shiny::observeEvent(input$path_shf, ignoreNULL = TRUE, ignoreInit = TRUE, {
    if (!is.integer(input$path_shf) & !is.null(input$path_shf)) {
      path_string <- shinyFiles::parseDirPath(roots = volumes, input$path_shf)
    } else {
      path_string <- ""
    }
    shiny::updateTextInput(session, "path_textin", value = path_string)
  })
  
  ## Error messages
  shiny::observe({
    output$path_errormess <- path_check(input$path_textin)
  })
  
  ## Save path in the reactive
  shiny::observe({
    path(normalizePath(input$path_textin))
  })

}
    
## To be copied in the UI
# mod_showDir_ui("showDir_ui_1")
    
## To be copied in the server
# callModule(mod_showDir_server, "showDir_ui_1")
 
