library(tidyverse)

view(mpg)

na_count <- vector(mode='integer',length=ncol(mpg))
for(i in ncol(mpg)){
  na_count[i] <- sum(is.na(mpg[,i]))
}
print(na_count)

str(mpg)
summary(mpg)
head(mpg,6)


par(mfrow=c(1,5))
boxplot(mpg["displ"],main=names(mpg["displ"]))
boxplot(mpg["year"],main=names(mpg["year"]))
boxplot(mpg["cyl"],main=names(mpg["cyl"]))
boxplot(mpg["cty"],main=names(mpg["cty"]))
boxplot(mpg["hwy"],main=names(mpg["hwy"]))

# Correlation between engine power and city miles per gallon 
# classified by class of the car.
# Added the geometric smooth curve also.
# There will be 62 missing values when class is classified using shape because
# only 6 shapes can be represented by default and all of the 7th category's entries will be discarded.
ggplot(mpg, aes(x=displ,y=cty)) +
  geom_point(aes(color=class,shape=as.factor(cyl))) +
  geom_smooth(aes(linetype=drv))

# Correlation between drive type and class of the car
ggplot(mpg) +
  geom_point(aes(x=drv, y=class))

# Correlation between drive type and number of cylinders
ggplot(mpg) +
  geom_point(aes(x=drv, y=cyl))

# Correlation between engine power and class of car
# classified by number of cylinders. Plotted this to see the trend and outliers in the trend
ggplot(mpg) +
  geom_point(aes(x=displ,y=hwy,color=class,shape=as.factor(cyl)))


# Correlation between engine power and highway miles per gallon
# classified by class of the car, number of cylinders and drive type.
ggplot(mpg) +
  geom_point(aes(x=displ,y=hwy,color=cyl)) +
  #facet_wrap(.~ class)
  facet_wrap(class ~ drv)


# Testing out different plots of correlation between displ, hwy and drv

ggplot(mpg, aes(x=displ,y=hwy)) +
  geom_point(size=6) +
  geom_smooth(se=FALSE)

ggplot(mpg, aes(x=displ,y=hwy)) +
  geom_point(size=5) +
  geom_smooth(data=filter(mpg,drv==4),se=FALSE) +
  geom_smooth(data=filter(mpg,drv=='r'),se=FALSE) +
  geom_smooth(data=filter(mpg,drv=='f'),se=FALSE) 

ggplot(mpg, aes(x=displ,y=hwy,color=drv)) +
  geom_point(size=5) 
  #geom_smooth(data=filter(mpg,drv=='r'),se=FALSE) 
  #geom_smooth(data=filter(mpg,drv==4),se=FALSE) +
  #geom_smooth(data=filter(mpg,drv=='f'),se=FALSE) 
