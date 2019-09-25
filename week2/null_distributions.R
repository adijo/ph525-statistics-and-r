library(dplyr)
data <- read.csv("week2/femaleControlsPopulation.csv") %>% unlist

set.seed(1)

iterations <- 10000
sampling_size <- 60 

null_distribution = vector("numeric", iterations)
for(i in 1:iterations) {
  null_distribution[i] <- mean(sample(data, sampling_size))
}

# sampling distribution of the mean
hist(null_distribution)

# the line below finds the proportion of values that are more than 1 gram
# away from the true population mean.
# as the `sampling_size` increases, this proportion will decrease.
mean(abs(null_distribution - mean(data)) > 1)
