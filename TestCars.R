setwd("C:/Pluralsight")

cars <- read.table(
  file = "Cars.txt",
  header = TRUE,
  sep="\t",
  quote = "\""
)

head(cars)

library(dplyr)

temp <- select(
  .data = cars,
  Transmission,
  Cylinders,
  Fuel.Economy
)

head(temp)

temp<-filter(
  .data = temp,
  Transmission=="Automatic"
)

head(temp)

temp <- mutate(
  .data = temp,
  Consumption=Fuel.Economy*0.425
)

head(temp)

temp <- group_by(
  .data = temp,
  Cylinders
)


head(temp)


temp <- summarise(
  .data = temp,
  Avg.Consumption=mean(Consumption)
)

head(temp)

temp <- arrange(
  .data = temp,
  desc(Avg.Consumption)
)


head(temp)


efficiency <- as.data.frame(
  temp
)

print(efficiency)

# Chain the method together
efficiency <- cars %>%
  select(Fuel.Enconomy, Cylinders, Transmission) %>%
  filter(Transmossion=="Automatic") %>%
  mutate(Consumption=Fuel.Enconomy*0.425)  %>%
  group_by(Cylinders) %>%
  summarize(Avg.Consumption=mean(Consumption))  %>%
  arrange(desc(Avg.Consumption))  %>%
  as.data.frame()

print(efficiency)

write.csv(
  x=efficiency,
  file = "Fuel Efficiency.csv",
  row.names = FALSE
)





