
context("scaling")

test_that("spark_line can scale horizontally", {

  csl <- spark(10)
  csl80 <- paste(rep(csl, getOption("width")), collapse = "")
  expect_equal(unclass(spark(rep(10, 100), width = "auto")), csl80)
  expect_equal(unclass(spark(rep(10, 100), width = "screen")), csl80)

})

test_that("scaling to shorter", {
  expect_equal(
    spark(rep(1:20, each = 2), width = 10),
    spark(1:10)
  )
})

test_that("scaling to longer", {
  expect_equal(
    spark(rep(1:10, each = 2)),
    spark(1:10, width = 20)
  )
})
