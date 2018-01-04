setwd("c:/Pluralsight")
cars <- read.csv("Cars.csv")

head(cars)


# Create a frequency table
table(cars$Transmission)


min(cars$Fuel.Economy)


max(cars$Fuel.Economy)

mean(cars$Fuel.Economy)

median(cars$Fuel.Economy)

quantile(cars$Fuel.Economy)

sd(cars$Fuel.Economy)

sum(cars$Fuel.Economy)

cor(
  x=cars$Cylinders,
  y=cars$Fuel.Economy
)

summary(cars)


library(ggplot2)

