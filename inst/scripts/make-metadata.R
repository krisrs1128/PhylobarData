# A script to make the metadata.csv file located in inst/extdata of the package.
# See ?AnnotationHubData::makeAnnotationHubMetadata for a description of the
# metadata.csv file, expected fields and data types. This
# AnnotationHubData::makeAnnotationHubMetadata() function can be used to
# validate the metadata.csv file before submitting the package.

# Create a data.frame with the required column names
metadata_df <- data.frame(
  Title = "zhang2023.oral_microbiome",
  Description = "Data from 'Influence of oral microbiome on longitudinal patterns of oral mucositis severity in patients with squamous cell carcinoma of the head and neck', Zhang et al (2023).",
  BiocVersion = "3.23",
  Genome = NA,
  SourceType = "RDS",
  SourceUrl = "https://doi.org/10.5281/zenodo.17179980/", # add a zenodo link
  SourceVersion = "0.99.0",
  Species = "Homo sapiens",
  TaxonomyId = 9606,
  Coordinate_1_based = 1,
  DataProvider = "The University of Texas MD Anderson Cancer Center",
  Maintainer = "ksankaran@wisc.edu",
  RDataClass = "phyloseq",
  DispatchClass = "Rds",
  Location_Prefix = "https://zenodo.org/records/17179980/files/",
  RDataPath = "zhang2023-ps.rds",
  Tags = "Microbiome:MicrobiomeData:ReproducibleResearch"
)

# Write the data.frame to metadata.csv
write.csv(metadata_df, file = "../extdata/metadata.csv", row.names = FALSE)
