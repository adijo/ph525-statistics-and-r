library(dplyr)
data <- read.csv("week2/femaleMiceWeights.csv")

control <- filter(data, Diet == "chow") %>% select(Bodyweight) %>% unlist

treatment <- filter(data, Diet == "hf") %>% select(Bodyweight) %>% unlist

obs <- mean(treatment)- mean(control)

population <- read.csv("week2/femaleControlsPopulation.csv") %>% unlist 

trials <- 10000
# in the null distribution, we assume that there is no difference
# between the treatment and the control. We plot the differences 
# by sampling from the population. We can then use this plot to 
# find the p-value of actually observing a value equal to the mean 
# treatment or more extreme. (given in the variable `obs`)
null_distribution = vector("numeric", trials)


for(i in 1:trials) {
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  null_distribution[i] <- mean(treatment) - mean(control)
}

# p-value
mean(abs(null_distribution) > obs)
