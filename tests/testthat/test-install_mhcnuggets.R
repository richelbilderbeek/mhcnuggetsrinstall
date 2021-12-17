test_that("use", {
  skip("Use 'ormr'")
  folder_name <- tempfile()
  expect_false(mhcnuggetsr::is_mhcnuggets_installed(folder_name = folder_name))
  install_mhcnuggets(folder_name = folder_name)
  expect_true(mhcnuggetsr::is_mhcnuggets_installed(folder_name = folder_name))
  expect_error(
    install_mhcnuggets(folder_name = folder_name),
    "MHCnuggets is already installed"
  )
  uninstall_mhcnuggets(folder_name = folder_name)
  expect_false(mhcnuggetsr::is_mhcnuggets_installed(folder_name = folder_name))

  expect_error(
    uninstall_mhcnuggets(folder_name = folder_name),
    "Cannot uninstall absent MHCnuggets"
  )

})

test_that("regular use", {
  if (!mhcnuggetsr::is_on_ci()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  uninstall_mhcnuggets()
  expect_false(mhcnuggetsr::is_mhcnuggets_installed())
  install_mhcnuggets()
  expect_true(mhcnuggetsr::is_mhcnuggets_installed())
})

test_that("install in different folder", {
  skip("Use 'ormr'")
  if (!mhcnuggetsr::is_on_ci()) return()
  if (!mhcnuggetsr::is_mhcnuggets_installed()) return()

  # Be able to restore situation before
  set_is_mhcnuggets_installed(FALSE)

  folder_name <- tempfile()
  expect_true(!mhcnuggetsr::is_mhcnuggets_installed(folder_name = folder_name))
  install_mhcnuggets(folder_name = folder_name)
  expect_true(mhcnuggetsr::is_mhcnuggets_installed(folder_name = folder_name))

  peptides_path <- mhcnuggetsr::get_example_filename(
    "test_peptides.peps",
    folder_name = folder_name
  )

  tryCatch({
      mhcnuggetsr::predict_ic50_from_file(
        peptides_path = peptides_path,
        mhcnuggets_options = create_test_mhcnuggets_options(
          folder_name = folder_name
        )
      )
    },
    error = function(e) {} # nolint this will fail when covr::codecov, with error 'hat this TensorFlow binary was not compiled to use: AVX2 AVX512F FMA', see https://travis-ci.org/github/richelbilderbeek/mhcnuggetsr/builds/691686575#L1038
  )

  uninstall_mhcnuggets(folder_name = folder_name)
  expect_false(mhcnuggetsr::is_mhcnuggets_installed(folder_name = folder_name))


  # Restore situation before
  set_is_mhcnuggets_installed(TRUE)
})

test_that("install in different folder", {
  skip("Use 'ormr'")
  if (!mhcnuggetsr::is_on_ci()) return()

  if (mhcnuggetsr::is_mhcnuggets_installed()) {
    expect_error(
      install_mhcnuggets(),
      "MHCnuggets is already installed"
    )
  }
})
