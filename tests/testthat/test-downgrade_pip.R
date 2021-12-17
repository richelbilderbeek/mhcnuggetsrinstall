test_that("use", {
  skip("Use 'ormr'")
  if (!mhcnuggetsr::is_on_ci()) return()
  if (!mhcnuggetsr::is_pip_installed()) return()

  # Only done by humans
  # Assumes at most currect version
  version_before <- mhcnuggetsr::get_pip_version()
  downgrade_pip("9.0.1")
  version_after <- mhcnuggetsr::get_pip_version()
  upgrade_pip()
  expect_true(version_before != version_after)
})
