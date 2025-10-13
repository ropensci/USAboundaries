# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
library(USAboundaries)

# Only run full test suite if USAboundariesData is available. Otherwise run a
# minimal test suite which relies only on this package.
if (require(USAboundariesData)) {
  test_check("USAboundaries")
} else {
  test_check("USAboundaries", filter = "standalone")
}
