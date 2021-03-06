<<<<<<< HEAD
setwd("C:\Pluralsight")
=======
setwd("c:/Pluralsight/RStudio_Test")

>>>>>>> 5b35c38caa4867e787ac2d488d19eac6c8a5ad30
data(iris)

head(iris)

<<<<<<< HEAD
install.packages('ff', dependencies=TRUE, repos='http://cran.rstudio.com/')
library(ff)

=======
library(ff)
>>>>>>> 5b35c38caa4867e787ac2d488d19eac6c8a5ad30
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



