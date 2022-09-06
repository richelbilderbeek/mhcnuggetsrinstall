#' Uninstall the MHCnuggets Python package.
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_mhcnuggets <- function(
  mhcnuggetsr_folder = mhcnuggetsr::get_default_mhcnuggets_folder(),
  ormr_folder_name = "python3"
) {
  if (!mhcnuggetsr::is_mhcnuggets_installed(
    mhcnuggetsr_folder = mhcnuggetsr_folder
    )
  ) {
    stop(
      "Cannot uninstall absent MHCnuggets from folder '",
      mhcnuggetsr_folder, "'"
    )
  }
  mhcnuggetsr::check_mhcnuggets_installation(
    mhcnuggetsr_folder = mhcnuggetsr_folder,
    ormr_folder_name = ormr_folder_name
  )

  # Uninstall the pip package
  system2(
    "python3",
    args = c("-m", "pip", "uninstall", "mhcnuggets", "--yes"),
    stdout = TRUE
  )

  # Delete folder
  unlink(mhcnuggetsr_folder, recursive = TRUE, force = TRUE)
  testthat::expect_true(!dir.exists(mhcnuggetsr_folder))
}
