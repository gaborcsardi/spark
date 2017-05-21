
context("utils")

test_that("is_installed", {
  expect_true(is_installed("spark"))
  expect_true(is_installed("clisymbols"))
  expect_true(is_installed("methods"))

  expect_false(is_installed("dfgdfgdfgdlgjelrigndflg2"))
})

test_that("which_max", {

  tol <- .Machine$double.eps^0.5
  
  expect_equal(which_max(c(1:5,5:1)), c(5,6))
  expect_equal(which_max(5:1), 1)
  expect_equal(which_max(1:5), 5)
  expect_equal(which_max(1), 1)
  expect_equal(which_max(c(1,1,1,1)), 1:4)
  expect_equal(
    which_max(c(1, 2, 3, 3 - tol/10, 3 + tol / 10, 3 - tol * 10, 2)),
    c(3,4,5)
  )
})
