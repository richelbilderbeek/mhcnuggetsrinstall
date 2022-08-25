#' Uninstall the MHCnuggets Python package.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_mhcnuggets <- function(
  folder_name = mhcnuggetsr::get_default_mhcnuggets_folder(),
  mhcnuggets_url = mhcnuggetsr::get_mhcnuggets_url()
) {
  if (!mhcnuggetsr::is_mhcnuggets_installed(
    folder_name = folder_name
    )
  ) {
    stop(
      "Cannot uninstall absent MHCnuggets from folder '",
      folder_name, "'"
    )
  }
  mhcnuggetsr::check_mhcnuggets_installation(
    folder_name = folder_name,
    mhcnuggets_url = mhcnuggets_url
  )

  # Uninstall the pip package
  system2(
    "python3",
    args = c("-m", "pip", "uninstall", "mhcnuggets", "--yes"),
    stdout = TRUE
  )

  # Delete folder
  mhcnuggets_folder <- file.path(folder_name, basename(mhcnuggets_url))
  unlink(mhcnuggets_folder, recursive = TRUE, force = TRUE)
  testthat::expect_true(!dir.exists(mhcnuggets_folder))
}
