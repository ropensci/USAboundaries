test_that("Cities function can take multiple kinds of input", {
  skip_if_not_installed("sf")
  expect_gt(nrow(us_cities()), 1)
  expect_gt(nrow(us_cities("1806-12-30")), 1)
  expect_gt(nrow(us_cities(as.Date("1806-12-30"))), 1)
  expect_gt(nrow(us_cities(1806)), 1)
  expect_error(us_cities(2020))
  expect_error(us_cities(1789))
  expect_message(us_cities())
})

test_that("Cities function returns an sf data.frame", {
  expect_s3_class(us_cities(1876), "data.frame")
  expect_s3_class(us_cities(1976), "sf")
})

test_that("Cities function can be filtered by state", {
  expect_identical(
    unique(us_cities(2010, states = "NC")$state_name),
    "North Carolina"
  )
  expect_identical(
    unique(us_cities(1876, states = "South Carolina")$state_abbr),
    "SC"
  )
})
