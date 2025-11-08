#' Check whether to install USAboundariesData and install if necessary
#'
#' If the \code{USAboundariesData} package is not installed, install it from the
#\href{http://packages.ropensci.org/}{rOpenSci repository}.
#' @export
check_data_package <- function() {
  # TODO update version
  USAboundariesData_version <- "0.5.0"

  if (!requireNamespace("USAboundariesData", quietly = TRUE)) {
    cli::cli_inform(
      "The {.pkg USAboundariesData} package needs to be installed."
    )
    install_USAboundariesData()
    # install_data_package()
  } else if (
    utils::packageVersion("USAboundariesData") < USAboundariesData_version
  ) {
    cli::cli_inform(
      "The {.pkg USAboundariesData} package needs to be updated."
    )
    install_USAboundariesData()
  }
}

#' Install the \code{USAboundariesData} package after checking with the user
#' @export
install_USAboundariesData <- function() {
  input <- 1L

  if (interactive()) {
    input <- utils::menu(
      c("Yes", "No"),
      title = "Install the USAboundariesData package?"
    )
  }

  if (input != 1L) {
    cli::cli_abort(
      "The {.pkg USAboundariesData} package is necessary for that method.\n Please try installing the package yourself with {.code pak::pkg_install(\"ropensci/USAboundariesData\")}"
    )
  }

  cli::cli_inform("Installing the {.pkg USAboundariesData} package.")

  tryCatch(
    pak::pkg_install("ropensci/USAboundariesData"),
    error = function(e) {
      cli::cli_inform(conditionMessage(e))
    }
  )
}
