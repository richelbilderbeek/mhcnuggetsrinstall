test_that("use", {
  if (!mhcnuggetsr::is_on_ci()) return()
  if (!mhcnuggetsr::is_pip_installed()) return()

  # Only works locally
  if (1 == 2) {

    # Store the current version
    # Assumes this is the latest upgrade
    current_version <- mhcnuggetsr::get_pip_version()

    # Pick version
    version <- "19.0"
    expect_true(version != current_version)
    set_pip_version(version)
    expect_equal(version, mhcnuggetsr::get_pip_version())

    # Pick version
    version <- "9.0.1"
    expect_true(version != current_version)
    set_pip_version(version)
    expect_equal(version, mhcnuggetsr::get_pip_version())

    # Restore current version
    # Note that 'set_pip_version("20.2")' does not work on Travis,
    # as this results in a warning to upgrade pip.
    set_pip_version(current_version)
    expect_equal(current_version, mhcnuggetsr::get_pip_version())
  }
})
