setwd("C:\Pluralsight")
data(iris)

head(iris)

install.packages('ff', dependencies=TRUE, repos='http://cran.rstudio.com/')
library(ff)

# Read a csv file as ff data frame
irisff<-read.table.ffdf(
  file = "Iris.csv",
  FUN="read.csv"
)



#Inspect the class
class(irisff)

names(irisff)

irisff[1:5, ]

install.packages('biglm', dependencies=TRUE, repos='http://cran.rstudio.com/')


library(biglm)


model <- biglm(
  formula = Petal.Width~Petal.Length,
  data = irisff
)


summary(model)

#Create a scatterplot

plot(
  x=irisff$Sepal.Length[],
  y=irisff$Sepal.Width[],
  main = "Iris Petal Length vs. Width",
  xlab="Petal Length (cm)",
  ylab = "Petal Width(cm)"
)

b<-summary(model)$mat[1,1]

m<-summary(model)$mat[1,2]


lines(
  x=irisff$Petal.Length[],
  y=m*irisff$Petal.Length[]+b,
  col="red",
  lwd=3
)

#predict new values with the model
predict(
  object = model,
  newdata = data.frame(
    Petal.Length=c(2,5,7),
    Petal.Width=c(0,0,0)
    
  )
)



