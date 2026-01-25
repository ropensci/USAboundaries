#' Check whether to install USAboundariesData and install if necessary
#'
#' If the \code{USAboundariesData} package is not installed, install it from the
#\href{http://packages.ropensci.org/}{rOpenSci repository}.
#' @export
#' @returns No return value: if USAboundariesData is not installed or a newer
#'   version is required, a console message will appear asking to install
#'   USAboundariesData. Else nothing will return.
check_data_package <- function() {
  # TODO update version
  USAboundariesData_version <- "0.5.1"

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
#' @return No return value: if USAboundariesData is not installed, it will ask
#'   the user if they want to install it. If user selects "yes" then it will be
#'   installed. If no, abort.
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
      "The {.pkg USAboundariesData} package is required.
   Install with {.code pak::pkg_install('ropensci/USAboundariesData')}"
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
