# Write code here to download the data you are using for your report.
# DO NOT push the data to your Github repository.

# For example, to download the simple Iris data from the UCI Machine Learning
# Repository
uci.iris <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data",
                     header = FALSE)

library("dplyr")
library("forcats")

# Apply the names as defined on the website https://archive.ics.uci.edu/ml/datasets/Iris
# and update the class labels to be shorter
uci.iris <- uci.iris %>%
  transmute(SepalLength = V1,
            SepalWidth  = V2,
            PetalLength = V3,
            PetalWidth  = V4,
            Class       = V5) %>%
  mutate(Class = fct_recode(Class,
                            Setosa     = "Iris-setosa",
                            Versicolor = "Iris-versicolor",
                            Virginica  = "Iris-virginica"))

# Save into Data directory which is not pushed to Github
saveRDS(uci.iris, "Data/uci_iris.rds")
