test_that("use", {
  if (!mhcnuggetsr::is_on_ci()) return()
  if (mhcnuggetsr::is_pip_installed()) return()

  install_pip()
  expect_true(mhcnuggetsr::is_pip_installed())
  uninstall_pip()
  expect_false(mhcnuggetsr::is_pip_installed())
})
