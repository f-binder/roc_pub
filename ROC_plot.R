# ROC plot
library(dplyr)
library(ggplot2)
library(pROC)

# Load data ------------------
data <- read_csv("data/roc_data.csv")

# Explore data ---------------
glimpse(data)
  # Score distributions of 2 predictors
  data %>%
    tidyr::gather(predictor, score, -1) %>%
    ggplot(aes(x = score, fill = factor(gt))) +
    geom_density(alpha = 0.5) +
    facet_wrap(~predictor, ncol = 1) +
    theme_bw(base_size = 16)
  
# ROC Curves ------------------

