# Building a Prod-Ready, Robust Shiny Application.
# 
# README: each step of the dev files is optional, and you don't have to 
# fill every dev scripts before getting started. 
# 01_start.R should be filled at start. 
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
# 
# 
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
# use renv to install/remove packages

# shinydashboard
renv::install("shinydashboard")         # 1. INSTALL the package
usethis::use_package("shinydashboard")  # 2. fill in DESCRIPTION
renv::snapshot()                        # 3. update RENV
# add it in ROXYGEN comments            # 4. add to ROXYGEN/NAMESPACE

# sen2rts
renv::install("ranghetti/sen2rts")      # 1. INSTALL the package
usethis::use_package("sen2rts")         # 2. fill in DESCRIPTION
renv::snapshot()                        # 3. update RENV
# add it in ROXYGEN comments            # 4. add to ROXYGEN/NAMESPACE

# # to remove a package:
# renv::remove("packagename")
# renv::snapshot()
# # remove it from DESCRIPTION
# # remove it from ROXYGEN comments

## Add modules ----

# Dashboard page to load S2 images
golem::add_module( name = "loadS2" )

# Block to show a directory content
golem::add_module( name = "showDir" )


## Add helper functions ----
## Creates ftc_* and utils_*
golem::add_fct( "helpers" ) 
golem::add_utils( "helpers" )

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file( "script" )
golem::add_js_handler( "handlers" )
golem::add_css_file( "custom" )

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw( name = "my_dataset", open = FALSE ) 

## Tests ----
## Add one line by test you want to create
usethis::use_test( "app" )

# Documentation

## Vignette ----
usethis::use_vignette("sen2rts.gui")
devtools::build_vignettes()

## Code coverage ----
## (You'll need GitHub there)
usethis::use_github()
usethis::use_travis()
usethis::use_appveyor()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

