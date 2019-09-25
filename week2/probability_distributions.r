install.packages("gapminder")
library(gapminder)
library(dplyr)

data(gapminder)
head(gapminder)


life_exp_countries_1952 <- filter(gapminder, year == 1952) %>% select(country, lifeExp)

# Pre Quiz Exploration
hist(select(life_exp_countries_1952, lifeExp) %>% unlist)

life_exp_1952 <- select(life_exp_countries_1952, lifeExp)

# Q1
mean(life_exp_1952 <= 40)


# Q2
mean(life_exp_1952 <= 60) - mean(life_exp_1952 <= 40)


# Q3

prop = function(q) {
  mean(life_exp_1952 <= q)
}

qs = seq(from=min(life_exp_1952), to=max(life_exp_1952), length=20)

props = sapply(qs, prop)

plot(qs, props)
