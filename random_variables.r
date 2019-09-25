library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile = filename)
data <- unlist(read.csv(filename))

population_mean <- mean(data)

# sample 1 mean
set.seed(1)
abs(mean(sample(data, 5)) - population_mean)

# sample 2 mean
set.seed(5)
abs(mean(sample(data, 5)) - population_mean)
