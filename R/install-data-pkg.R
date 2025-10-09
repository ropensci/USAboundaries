#
# If the \code{USAboundariesData} package is not installed, install it from
# the \href{http://packages.ropensci.org/}{rOpenSci repository}.
check_data_package <- function() {
  package_version <- "0.5.0"

  instructions <- paste(
    " Please try installing the package",
    "using the following command: \n",
    "    install.packages(\"USAboundariesData\",",
    "repos = \"https://ropensci.r-universe.dev\",",
    "type = \"source\")"
  )
  if (!requireNamespace("USAboundariesData", quietly = TRUE)) {
    message("The USAboundariesData package needs to be installed.")
    message(instructions)
    # install_data_package()
  } else if (utils::packageVersion("USAboundariesData") < package_version) {
    message("The USAboundariesData package needs to be updated.")
    message(instructions)
    # install_data_package()
  }
}

#' Install the \code{USAboundariesData} package after checking with the user
install_data_package <- function() {
  instructions <- paste(
    " Please try installing the package for yourself",
    "using the following command: \n",
    "    install.packages(\"USAboundariesData\",",
    "repos = \"https://ropensci.r-universe.dev\",",
    "type = \"source\")"
  )

  error_func <- function(e) {
    message(e)
    cat(paste(
      "\nFailed to install the USAboundariesData package.\n",
      instructions,
      "\n"
    ))
  }
  warning_func <- function(c) {
    message(c)
    cat(paste(
      "\nFailed to install the USAboundariesData package.\n",
      instructions,
      "\n"
    ))
  }

  if (interactive()) {
    input <- utils::menu(
      c("Yes", "No"),
      title = "Install the USAboundariesData package?"
    )
    if (input == 1) {
      message("Installing the USAboundariesData package.")
      tryCatch(
        utils::install.packages(
          "USAboundariesData",
          repos = "http://ropensci.r-universe.dev",
          contriburl = "http://ropensci.r-universe.dev/src/contrib",
          type = "source"
        ),
        error = error_func,
        warning = warning_func
      )
    } else {
      stop(paste(
        "The USAboundariesData package provides the data you requested.\n",
        instructions
      ))
    }
  } else {
    stop(paste(
      "Failed to install the USAboundariesData package.\n",
      instructions
    ))
  }
}

.onAttach <- function(libname, pkgname) {
  invisible(check_data_package())
}
