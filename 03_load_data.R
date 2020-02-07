# Write code here to load the data you downloaded in download_data.R

uci.iris <- readRDS("Data/uci_iris.rds")

# You might choose to do any resampling here to ensure it is consistent across
# models

set.seed(7482) # set seed for reproducibility

library("rsample")
uci.iris.cv <- rsample::vfold_cv(uci.iris, v = 3, strata = Class)
