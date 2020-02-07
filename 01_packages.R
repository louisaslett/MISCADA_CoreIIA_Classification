# Define the packages your code requires in the vector below.
# This will allow the marker of your report to easily get all the packages they
# require
# Specify packages on CRAN:
report.packages.cran <- c("dplyr",
                          "forcats",
                          "rsample",
                          "ranger",
                          "pROC")

# Packages on BioConductor:
report.packages.bioc <- c()

# Packages on Github (provide as username/packagename)
report.packages.github <- c()



# The following code will install anything that is missing:
# CRAN
to.install <- setdiff(report.packages.cran, installed.packages()[,"Package"])
if(length(to.install) > 0)
  install.packages(to.install)

# Bioconductor
if(!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
  BiocManager::install(ask = FALSE)
}

to.install <- setdiff(report.packages.bioc, installed.packages()[,"Package"])
if(length(to.install) > 0)
  BiocManager::install(to.install, ask = FALSE)

# Github
if(!requireNamespace("devtools", quietly = TRUE))
  install.packages("devtools")

if(length(report.packages.github) > 0)
  to.install <- report.packages.github[which(!(as.character(as.data.frame(strsplit(report.packages.github, "/"))[,2]) %in% installed.packages()[,"Package"]))]
if(length(to.install) > 0)
  devtools::install_github(to.install)
