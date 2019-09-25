library(dplyr)
library(rafalib)

data <- read.csv("week2/mice_pheno.csv") %>% 
  na.omit
 
y <- filter(data, 
            Sex == "M",
            Diet == "chow" 
            ) %>% 
  select(Bodyweight) %>% 
  unlist

z_scores <- (y - mean(y)) / popsd(y)

# Q4
mean(abs(z_scores) <= 1)

# Q5
mean(abs(z_scores) <= 2)

# Q6
mean(abs(z_scores) <= 3)

# Q7
qqnorm(z_scores)
abline(0, 1)

# Q9
avgs <- replicate(10000, 
                  mean(sample(y, 25))
                  )
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

mean(avgs)

# Q10
popsd(avgs)


