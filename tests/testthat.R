library(testthat)
library(USAboundaries)

# Only run full test suite if USAboundariesData is available. Otherwise run a
# minimal test suite which relies only on this package.
if (require(USAboundariesData)) {
  test_check("USAboundaries")
} else {
  test_check("USAboundaries", filter = "standalone")
}
