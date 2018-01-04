data("iris")

head(iris)

plot(
  x= iris$Petal.Length,
  y=iris$Petal.Width,
  main="Iris Petal Length vs Width",
  xlab = "Petal Length (cm)",
  ylab= "Petal Width(cm)"
)

#Create Linear regression model

model <- lm(
  formula = Petal.Width ~ Petal.Length,
  data = iris
)

summary(model)

lines(
  x=iris$Petal.Length,
  y=model$fitted,
  col="green",
  lwd=3
)

cor(
  x=iris$Sepal.Length,
  y=iris$Petal.Width
)

#predict new values from the model
predict(
  object = model,
  newdata=data.frame(
    Petal.Length=c(2,5,7)
  )
)

library(ff)
