test_that("regular use", {
  if (!mhcnuggetsr::is_on_ci()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  uninstall_mhcnuggets()
  expect_false(mhcnuggetsr::is_mhcnuggets_installed())
  install_mhcnuggets()
  expect_true(mhcnuggetsr::is_mhcnuggets_installed())
})

test_that("install in different folder", {
  if (!mhcnuggetsr::is_on_ci()) return()

  if (mhcnuggetsr::is_mhcnuggets_installed()) {
    expect_error(
      install_mhcnuggets(),
      "MHCnuggets is already installed"
    )
  }
})
