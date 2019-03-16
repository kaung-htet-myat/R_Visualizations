library(ggplot2)

df <- iris

# Dataset Summary
head(df)
summary(df)
str(df)

# Boxplotting of variables
par(mfrow=c(1,4))
for(i in 1:4){
  boxplot(df[,i],main=names(iris)[i])
}

# Histograms of variables
for(i in 1:4){
  hist(df[,i],main=names(iris)[i],xlab=names(iris)[i],col="steelblue")
}

# Correlation between Sepal Length and Sepal Width
g1 <- ggplot(df, aes(x=Sepal.Length,y=Sepal.Width)) +
      #geom_line(col="green")
      geom_point(col="green") +
      geom_smooth(method="lm")

# Correlation between Petal Length and Petal Width
g2 <- ggplot(df, aes(x=Petal.Length,y=Petal.Width)) +
      geom_point(col="steelblue", size=df$Sepal.Width) +
      #geom_line(col="steelblue")
      geom_smooth(method="lm")

plot(g1)
plot(g2)
