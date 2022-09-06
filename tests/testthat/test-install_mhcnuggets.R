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

  mhcnuggetsr_folder <- tempfile()
  expect_false(
    mhcnuggetsr::is_mhcnuggets_installed(
      mhcnuggetsr_folder = mhcnuggetsr_folder
    )
  )
  install_mhcnuggets(mhcnuggetsr_folder = mhcnuggetsr_folder)
  expect_true(
    mhcnuggetsr::is_mhcnuggets_installed(
      mhcnuggetsr_folder = mhcnuggetsr_folder
    )
  )
  uninstall_mhcnuggets(mhcnuggetsr_folder = mhcnuggetsr_folder)
  expect_false(
    mhcnuggetsr::is_mhcnuggets_installed(
      mhcnuggetsr_folder = mhcnuggetsr_folder
    )
  )
})
