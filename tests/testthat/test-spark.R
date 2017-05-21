
context("Spark lines")

test_that("spark_line works", {
    
  tests <- list(
    list(c(0,30,55,80,33,150), '123528'),
    list(c(1, 5, 22, 13, 53), '11428'),
    list(0:7, '12345678'),
    list(c(0, NaN, 7), '1 8'),
    list(c(1,9,6,2,1,3,6,5,3,7,6,9), '185112542658')
  )

  mockr::with_mock(
    spark_ticks = function() as.character(1:8),
    sapply(seq_along(tests), function(i) {
      expect_equal(unclass(spark(tests[[i]][[1]])),
                   tests[[i]][[2]],
                   info = paste("#", i))
    })
  )
})

test_that("spark_line for constant data is good", {

  mockr::with_mock(
    spark_ticks = function() as.character(1:8),
    expect_equal(unclass(spark(rep(10, 5))), '44444')
  )
})

test_that("printing", {
  mockr::with_mock(
    spark_ticks = function() as.character(1:8),
    {
      s <- spark(1:10)
      expect_output(print(s), s)
    }
  )
})

test_that("auto width", {
  s <- spark(1:10, width = "auto")
  expect_equal(nchar(s), 10)

  s <- spark(1:1000, width = "auto")
  expect_equal(nchar(s), getOption("width"))
})

test_that("constant data", {
  s <- spark(rep(1, 10))
  ss <- strsplit(s, "")[[1]]
  expect_equal(length(ss), 10)
  expect_equal(length(unique(ss)), 1)
  expect_true(ss[1] %in% spark_ticks())

  s <- spark(rep(0, 10))
  ss <- strsplit(s, "")[[1]]
  expect_equal(length(ss), 10)
  expect_equal(length(unique(ss)), 1)
  expect_true(ss[1] %in% spark_ticks())
})

test_that("marking the max", {
  s <- withr::with_options(
    list(crayon.enabled = TRUE, crayon.colors = 256),
    spark(c(1:3, 3:1), max = crayon::red)
  )
  expect_true(crayon::has_style(s))
})

test_that("marking the max without crayon", {
  mockr::with_mock(
    `is_installed` = function(...) FALSE,
    expect_warning(
      spark(c(1:3, 3:1), max = "red"),
      "The .crayon. package is needed"
    )
  )
})
