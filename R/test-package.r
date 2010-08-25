#' Run all tests in an installed package
#' 
#' Test are run in an environment that inherits from the package environment
#' so that tests can access non-exported functions and variables.
#'
#' @param package package name
#' @export
#' @examples
#' test_package("testthat")
test_package <- function(package) {
  test_path <- system.file("tests", package = package)
  
  env <- new.env(parent = getNamespace(package))
  test_dir(test_path, StopReporter, env)
}