library(dplyr)
library(rafalib)

data <- read.csv("week2/mice_pheno.csv") %>% na.omit

x <- filter(data,
            Sex == "M",
            Diet == "chow") %>% 
  select(Bodyweight) %>% 
  unlist

# Q1
mean(x)

# Q2
popsd(x)

set.seed(1)
X <- sample(x, 25)
mean(X)

y <- filter(data, 
            Sex == "M", 
            Diet == "hf") %>%
  select(Bodyweight) %>% 
  unlist

# Q3
mean(y)

# Q4
popsd(y)

# Q5
set.seed(1)
Y <- sample(y, 25)
mean(Y)

# Q6
set.seed(1)
abs((mean(y) - mean(x)) - (mean(Y) - mean(X)))
