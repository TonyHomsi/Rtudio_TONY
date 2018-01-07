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


model <- tree(
  
)
