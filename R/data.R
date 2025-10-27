#' Zhang et al. (2023) oral microbiome dataset
#'
#' phyloseq object containing oral microbiome data from head and neck
#' cancer patients with longitudinal oral mucositis severity patterns.
#'
#' These data can be used to reproduce the results in the paper, "Oral microbial
#' signatures of head and neck cancer patients with diverse longitudinal oral
#' mucositis severity patterns," which analyzes a data set originally generated in
#' "Influence of oral microbiome on longitudinal patterns of oral mucositis
#' severity in patients with squamous cell carcinoma of the head and neck." Code
#' to reproduce the examples can be found at the OMScoreAnalysis repository on
#' Github: https://github.com/SarithaKodikara/OMScoreAnalysis.
#'
#' @return A phyloseq object combining microbiome and sample information
#' @source Zhang et al. (2023) "Influence of oral microbiome on longitudinal patterns"
#' @examples
#' \dontrun{
#'   ps <- zhang2023.oral_microbiome()
#' }
#' @export
zhang2023.oral_microbiome <- function() {
  eh_get_by_title("zhang2023.oral_microbiome")
}

#' Su et al. COVID-19 immunology dataset
#'
#' SummarizedExperiment containing COVID-19 immunology data from the study
#' "Multi-Omics Resolves a Sharp Disease-State Shift between Mild and Moderate
#' COVID-19" by Su et al. 2019, Cell Vol 183 Issue 16.
#'
#' @return A SummarizedExperiment object
#' @source https://doi.org/10.1016/j.cell.2020.10.037
#' @seealso https://zenodo.org/records/17430294
#' @examples
#' \dontrun{
#'   se <- su2019.covid_immunology()
#' }
#' @export
su2019.covid_immunology <- function() {
  eh_get_by_title("su2019.covid_immunology")
}

# internal helper to query experiment hub
eh_get_by_title <- function(title) {
  hub <- ExperimentHub::ExperimentHub()
  hits <- AnnotationHub::query(hub, c("PhylobarData", title))

  if (length(hits) == 0L) {
    # Fallback for local development before EH submission
    local_file <- system.file("extdata", paste0(title, ".rds"), package = "PhylobarData")
    if (file.exists(local_file)) {
      message("ExperimentHub record not found. Loading from local file for development.")
      return(readRDS(local_file))
    }
    stop("No ExperimentHub record found for Title '", title, "' in package 'PhylobarData'.")
  }

  hits[[1]]
}