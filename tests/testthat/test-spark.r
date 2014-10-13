
context("Spark lines")

test_that("spark_line works", {

  tests <- list(
    list(c(0,30,55,80,33,150), '▁▂▃▅▂█'), # 1
    list(c(1, 5, 22, 13, 53), '▁▁▄▂█'),   # 2
    list(0:7, '▁▂▃▄▅▆▇█'),                # 3
    list(c(0, NaN, 7), '▁ █'),            # 4
    list(c(1,9,6,2,1,3,6,5,3,7,6,9), '▁█▅▁▁▂▅▄▂▆▅█') # 5
  )

  sapply(seq_along(tests), function(i) {
    expect_equal(spark(tests[[i]][[1]]),
                 tests[[i]][[2]],
                 info = paste("#", i))
  })
})

test_that("spark_line for constant data is good", {

  expect_equal(spark(rep(10, 5)), '▄▄▄▄▄')

})

test_that("spark_line can scale horizontally", {

  csl <- spark(10)
  csl80 <- paste(rep(csl, getOption("width")), collapse = "")
  expect_equal(spark(rep(10, 100), width = "auto"), csl80)
  expect_equal(spark(rep(10, 100), width = "screen"), csl80)

})
