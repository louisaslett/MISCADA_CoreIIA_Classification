# Load the data
source("03_load_data.R")

# Let's fit a simple random forest
library("ranger")

fit.rf <- list()
pred.rf <- data.frame(Setosa = double(),
                      Versicolor = double(),
                      Virginica = double(),
                      Truth = character())
for(i in 1:3) {
  fit.rf[[i]] <- ranger(Class ~ ., data = analysis(uci.iris.cv$splits[[i]]), probability = TRUE)
}

