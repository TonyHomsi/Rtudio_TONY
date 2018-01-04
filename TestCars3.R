setwd("c:/Pluralsight")

cars <- read.csv("Cars.csv")

library(ggplot2)


ggplot(
  data=cars,
  aes(x=Fuel.Economy))+
  geom_histogram(
    bins = 10
  )+
  ggtitle("Distribution of Fuel Economy")+
  xlab("Fuel Economy (mpg)")+
  ylab("Count of cars")


ggplot(
  data=cars,
  aes(x=Transmission))+
  geom_bar()+
  ggtitle("Count of Cars by Transmission Type")+
  xlab("Transmission Type")+
  ylab("Count of cars")



ggplot(
  data = cars,
  aes(x=Fuel.Economy))+
  geom_density()+
  ggtitle("Distribution of Fuel Economy")+
  xlab("Fuel Economy (mpg)")+
  ylab("Count of cars")


ggplot(
  data = cars,
  aes(
    x=Cylinders,
    y=Fuel.Economy))+
  geom_point()+
  ggtitle("Fuel Economy by Cylinders")+
  xlab("Fuel Economy by Cylinders")+
  ylab("Fuel Economy(mpg)")
  
