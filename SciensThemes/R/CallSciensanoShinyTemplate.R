#' Run the Custom Shiny App Template
#'
#' This function launches the custom Shiny app template included in the package.
#'
#' @export
runTemplateShiny <- function() {
  appDir <- system.file("shiny-template", package = "SciensThemes")
  if (appDir == "") {
    stop("Could not find Shiny app directory. Try re-installing `SciensThemes`.", call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = "normal")
}

#' Create shiny app template directory
#'
#' Copy Shiny App Template
#'
#' This function copies the Shiny app template from the package to a specified directory
#' for further modification.
#'
#' @param destination A character string specifying the directory where the template
#' should be copied.
#'
#' @return
#' @export
#'
#' @examples
CopyShinyTemplate <- function(destination= ".") {
  appDir <- system.file("shiny-template", package = "SciensThemes")
  if (appDir == "") {
    stop("Could not find Shiny app directory. Try re-installing `SciensThemes`.", call. = FALSE)
  }
  if (!dir.exists(destination)) {
    dir.create(destination, recursive = TRUE)
  }
  file.copy(list.files(appDir, full.names = TRUE), destination, recursive = TRUE)
  if (destination== ".") {
    message("Template copied inside Project directory")
  }else{
    message("Template copied to ", destination)
  }

}

#' Run the Custom Shinydashboard Template
#'
#' This function launches the custom Shinydashboard template included in the package.
#'
#' @export
runTemplateDashboard <- function() {
  appDir <- system.file("shinydashboard-template", package = "SciensThemes")
  if (appDir == "") {
    stop("Could not find Shinydashboard directory. Try re-installing `SciensThemes`.", call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = "normal")
}

#' Create Shinydashboard template directory
#'
#' Copy Shinydashboard Template
#'
#' This function copies the Shinydashboard template from the package to a specified directory
#' for further modification.
#'
#' @param destination A character string specifying the directory where the template
#' should be copied.
#'
#' @return
#' @export
#'
#' @examples
CopyShinyDashboard <- function(destination= ".") {
  appDir <- system.file("shinydashboard-template", package = "SciensThemes")
  if (appDir == "") {
    stop("Could not find Shiny app directory. Try re-installing `SciensThemes`.", call. = FALSE)
  }
  if (!dir.exists(destination)) {
    dir.create(destination, recursive = TRUE)
  }
  file.copy(list.files(appDir, full.names = TRUE), destination, recursive = TRUE)
  if (destination== ".") {
    message("Template copied inside Project directory")
  }else{
    message("Template copied to ", destination)
  }

}
