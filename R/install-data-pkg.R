# Check whether to install data for gender function and install if necessary
#
# If the \code{USAboundariesData} package is not installed, install it from
# the \href{http://packages.ropensci.org/}{rOpenSci repository}.
check_data_package <- function() {
  package_version <- "0.2.0"
  if (!requireNamespace("USAboundariesData", quietly = TRUE)) {
    message("The USAboundariesData package needs to be installed.")
    install_data_package()
  } else if (utils::packageVersion("USAboundariesData") < package_version) {
    message("The USAboundariesData package needs to be updated.")
    install_data_package()
  }
}

#' Install the \code{USAboundariesData} package after checking with the user
#' @export
install_data_package <- function() {
  instructions <- paste(" Please try installing the package for yourself",
                        "using the following command: \n",
  "    install.packages(\"USAboundariesData\",",
  "repos = \"http://packages.ropensci.org\",",
  "type = \"source\")")

  error_func <- function(e) {
    stop(paste("Failed to install the USAboundariesData package.\n", instructions))
  }

  if (interactive()) {
    input <- utils::menu(c("Yes", "No"),
                         title = "Install the USAboundariesData package?")
    if (input == 1) {
      message("Installing the USAboundariesData package.")
      tryCatch(utils::install.packages("USAboundariesData",
                                       repos = "http://packages.ropensci.org",
                                       type = "source"),
               error = error_func, warning = error_func)
    } else {
      stop(paste("The USAboundariesData package provides the data you requested.\n",
                 instructions))
    }
  } else {
    stop(paste("Failed to install the USAboundariesData package.\n", instructions))
  }
}
