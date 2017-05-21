
context("spark.matrix")

test_that("common scale", {
  M <- rbind(1:10, 2*1:10)
  s <- spark(M)
  s2 <- substring(spark(1:20), 1, 10)
  expect_equal(s[1], s2[1])
})

test_that("different scales", {
  M <- rbind(1:10, 2*1:10)
  s <- spark(M, common_scale = FALSE)
  expect_equal(s[1], s[2])
})
