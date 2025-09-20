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

data_dir <- path("~/Downloads") # directory with the downloaded zenodo link
#data_dir <- "./" # directory with the downloaded zenodo link
tree <- read.tree(data_dir / "FeatureTable.tre")
tree$node.label <- make.unique(tree$node.label)
metadata <- readRDS(data_dir / "noisyMetaData.rds")
x <- readRDS(data_dir / "noisyMicrobiome.rds")

ps <- phyloseq(
    otu_table(x, taxa_are_rows = TRUE),
    sample_data(metadata),
    phy_tree(tree)
)

saveRDS(ps, "zhang2023-ps.rds")