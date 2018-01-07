setwd("c:/Pluralsight/RStudio_Test")
data(iris)

#set a seed to made randomness reproducable
set.seed(42)


#Randomly sample 100 of 150 row indexes
indexes <- sample(
  x=1:150,
  size=100
)

print(indexes)

# Create a training set from indexes
train <- iris[indexes, ]

# Create a test set from the remaining indexes
test <- iris[-indexes, ]

# load the decision tree
## Very Important to use this link
options(repos = c(CRAN = "http://cran.rstudio.com"))

install.packages("tree")

#load the decision tree package
library(tree)

model <- tree(
  formula= Species ~ .,
  data= train
  
)

# inspect the model
summary(model)

#Visiualize the decison ree model
plot(model)
text(model)


install.packages("RColorBrewer")
#Load color brewer library
library(RColorBrewer)

# Create a color palette
palette <- brewer.pal(3,"Set2")


#Create a scatterplot colored by species
plot(
  x= iris$Sepal.Length,
  y= iris$Sepal.Width,
  pch=19,
  col=palette[as.numeric(iris$Species)],
  main="Iris Petal Length vs. Width",
  xlab = "Petal Length(cm)",
  ylab = "Petal Width(cm)"
)

#plot the decision boundaries
partition.tree(
  tree = model,
  label = "Species",
  add = TRUE
)

#Predict with model
presidents <- predict(
  object = model,
  newdata = test,
  type = "class"
  
)

#COnfusion Matrix
table(
  x=predictions,
  y=test$Species
)
