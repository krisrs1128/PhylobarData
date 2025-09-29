# A script describing the steps involved in making the data object(s). This
# includes where the original data were downloaded from, pre-processing, and
# how the final R object was made. Include a description of any steps performed
# outside of R with third party software. Output of the script should be files
# on disk ready to be pushed to S3. If data are to be hosted on a personal web
# site instead of S3, this file should explain any manipulation of the data
# prior to hosting on the web site. For data hosted on a public web site with
# no prior manipulation this file is not needed.
library(phyloseq)
library(ape)
library(fs)
library(tibble)
library(dplyr)

# organize data downloads
data_dir <- path("https://github.com/SarithaKodikara/OMScoreAnalysis/raw/refs/heads/main/Analysis/data/")
tree_path <- tempfile()
taxa_path <- tempfile()
metadata_path <- tempfile()
otu_path <- tempfile()
download.file(data_dir / "FeatureTable.tre", tree_path)
download.file(data_dir / "taxonomy_table.csv", taxa_path)
download.file(data_dir / "OTU_table.csv", otu_path)
download.file(data_dir / "patientdata_3obs_allresponses.csv", metadata_path)

tree <- read.tree(tree_path)
tree$node.label <- make.unique(tree$node.label)
metadata <- read.csv(metadata_path)
x <- read.csv(otu_path) |>
    column_to_rownames("X") %>%
    setNames(gsub("MBB", "MB", gsub("MF", "MB", names(.)))) %>%
    setNames(sub(".*MB", "MB", sub("\\.$", "", names(.))))

metadata <- metadata |>
    filter(Sample != "MB054.FU4") # not found in colnames of x
x <- x[, which(colnames(x) %in% metadata$Sample)]
x <- x[, metadata$Sample]

metadata <- metadata |>
    arrange(Sample) |>
    column_to_rownames("Sample")

taxonomy <- read.csv(taxa_path) |>
    column_to_rownames("OTUId") |>
    as.matrix()

ps <- phyloseq(
    otu_table(x, taxa_are_rows = TRUE),
    sample_data(metadata),
    phy_tree(tree),
    tax_table(taxonomy)
)