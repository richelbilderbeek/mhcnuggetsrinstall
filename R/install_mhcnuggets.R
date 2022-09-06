#' Install the \code{MHCnuggets} \code{Python} package.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \dontrun{
#'   install_mhcnuggets()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_mhcnuggets <- function(
  mhcnuggetsr_folder = mhcnuggetsr::get_default_mhcnuggets_folder(),
  mhcnuggets_url = mhcnuggetsr::get_mhcnuggets_url()
) {
  if (
    mhcnuggetsr::is_mhcnuggets_installed(
      mhcnuggetsr_folder = mhcnuggetsr_folder
    )
  ) {
    stop("MHCnuggets is already installed in folder '", mhcnuggetsr_folder, "'")
  }

  # Create the folder if needed, do not warn if it is already present
  dir.create(mhcnuggetsr_folder, showWarnings = FALSE, recursive = TRUE)

  # Check if already cloned
  mhcnuggets_folder <- file.path(mhcnuggetsr_folder, basename(mhcnuggets_url))
  if (!dir.exists(mhcnuggets_folder)) {
    curwd <- getwd()
    on.exit(setwd(curwd))
    setwd(mhcnuggetsr_folder)
    system2(
      command = "git",
      args = c(
        "clone",
        paste0(mhcnuggets_url, ".git")
      )
    )
    setwd(curwd)
  }
  testthat::expect_true(dir.exists(mhcnuggetsr_folder))

  ormr::install_python_package(
    ormr_folder_name = "python3",
    package_name = "mhcnuggets"
  )
}
