# A script to make the metadata.csv file located in inst/extdata of the package.
# See ?AnnotationHubData::makeAnnotationHubMetadata for a description of the
# metadata.csv file, expected fields and data types. This
# AnnotationHubData::makeAnnotationHubMetadata() function can be used to
# validate the metadata.csv file before submitting the package.

# Create a data.frame with the required column names
metadata_df <- data.frame(
  Title = c("zhang2023.oral_microbiome","su1019.covid_immunology")
  Description = c("Data from 'Influence of oral microbiome on longitudinal patterns of oral mucositis severity in patients with squamous cell carcinoma of the head and neck', Zhang et al (2023).",
  "Data from 'Su, Y., Chen, D., Yuan, D., et al. (2020). Multi-Omics Resolves a Sharp Disease-State Shift between Mild and Moderate COVID-19. Cell, 183(6), 1479-1495' and derived according to the DIVAS algortihm. https://zenodo.org/records/17430294" )
  BiocVersion = c("3.23", "3.23"),
  Genome = rep(NA, 2),
  SourceType = rep("RDS", 2)
  SourceUrl = c("https://doi.org/10.5281/zenodo.17179980/", "https://zenodo.org/records/17430294")
  SourceVersion = c("0.99.0", "0.99.0"),
  Species = c("Homo sapiens", "Homo sapiens"),
  TaxonomyId = c(9606, 9606),
  Coordinate_1_based = rep(1, 2),
  DataProvider = c("The University of Texas MD Anderson Cancer Center", "University of Washington"),
  Maintainer = rep("ksankaran@wisc.edu", 2)
  RDataClass = c("phyloseq", "SummarizedExperiment"),
  DispatchClass = rep("Rds", 2)
  Location_Prefix = c("https://zenodo.org/records/17179980/files/", "https://zenodo.org/records/17430294/files"),
  RDataPath = c("zhang2023-ps.rds", "su2019.covid_immunology"),
  Tags = c("Microbiome:MicrobiomeData:ReproducibleResearch", "SingleCell:SingleCellData:ReproducibleResearch"
)

# Write the data.frame to metadata.csv
write.csv(metadata_df, file = "../extdata/metadata.csv", row.names = FALSE)
