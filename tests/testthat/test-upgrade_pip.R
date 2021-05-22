test_that("use", {
  if (!mhcnuggetsr::is_on_ci()) return()
  if (!mhcnuggetsr::is_pip_installed()) return()

  # Does nothing, expect to be at the most current version
  expect_silent(upgrade_pip())

})
