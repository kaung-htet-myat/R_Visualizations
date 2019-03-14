library(ggplot2)
data("midwest",package="ggplot2")

# Simple Plotting
g <- ggplot(midwest, aes(x=area,y=poptotal)) +
      geom_point(aes(col=state),size=3) +
      geom_smooth(method="lm")
      #xlim(c(0,0.1)) +
      # ylim(c(0,1000000))
  
g1 <- g +
      coord_cartesian(xlim=c(0,0.1), ylim=c(0,1000000)) +
      labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

plot(g1)

# Boxplotting

df <- iris
par(mfrow=c(1,4))
  for(i in 1:4){
    boxplot(df[,i],main=names(iris)[i])
  }

# Histogram
par(mfrow=c(1,1))
hist(iris$Sepal.Length, col="steelblue",main = "Length of the sepal" ,xlab="Length of the sepal")
