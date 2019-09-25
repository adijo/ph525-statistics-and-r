library(dplyr)

data <- read.csv("week2/femaleControlsPopulation.csv") %>% unlist

set.seed(1)


compute_sampling_distribution = function(num_samples, num_trials) {
  sampling_distribution = vector("numeric", num_samples)
  for(i in 1:num_trials) {
    sampling_distribution[i] <- mean(sample(data, num_samples))
  }
  sampling_distribution
}

# Q1
num_trials <- 1000
hist(compute_sampling_distribution(5, num_trials))
hist(compute_sampling_distribution(50, num_trials))


# Q2
sampling_dist_50 <- compute_sampling_distribution(50, num_trials)
mean(sampling_dist_50 <= 25) - mean(sampling_dist_50 <= 23)

# Q3
pnorm(25, 23.9, 0.43) - pnorm(23, 23.9, 0.43)
