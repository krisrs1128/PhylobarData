context("metadata validity")

test_that("metadata is valid",
{
    if(!requireNamespace("ExperimentHubData", quietly = TRUE))
        BiocManager::install("ExperimentHubData")

    path <- find.package("")
    metadata <- system.file("extdata", "metadata.csv", package = "OralCancerMicrobiome")
    expect_true(ExperimentHubData::makeExperimentHubMetadata(path, metadata))
})

library(tidyverse)
example(geom_histogram)

ggplot(economics_long, aes(value)) +
    facet_wrap(~variable, scales = 'free_x') +
    geom_histogram(binwidth = \(x) 2 * IQR(x) / (length(x)^(1/3))) +
    scale_x_continuous(expand = c(0, 0)) +
    scale_y_continuous(expand = expansion(mult = c(0, 0.1)))
