#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom shinydashboard dashboardBody dashboardHeader dashboardPage
#'  dashboardSidebar menuItem sidebarMenu tabItem tabItems
#' @noRd
app_ui <- function(request) {
  
  # Location of translations
  i18n <- suppressWarnings(
    Translator$new(translation_csvs_path = app_sys("app/translations"))
  )
  i18n$set_translation_language(getShinyOption("ui_lang", "en"))
  
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    dashboardPage(
      dashboardHeader(title = "sen2rts GUI"),
      ## Sidebar content
      dashboardSidebar(
        sidebarMenu(
          menuItem("Load images", tabName = "tab_loadS2", icon = icon("home"))
        )
      ),
      ## Body content
      dashboardBody(
        tabItems(
          
          # Load S2 images
          tabItem(
            tabName = "tab_loadS2",
            mod_loadS2_ui("loadS2_1", i18n = i18n)
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @import shiny.i18n
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'sen2rts.gui'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

