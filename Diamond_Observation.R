library(tidyverse)

data("diamonds")

#diamonds[c(4,6)] <- NA  -- will set the 4th and 6th columns to NA values
#diamonds[4,6] <- NA -- will set the 4th entry of 6th column to NA value

str(diamonds)
summary(diamonds)
head(diamonds,6)

na_counts = vector(mode="integer",length=ncol(diamonds))
for(i in 1:ncol(diamonds)){
  na_counts[i] <- sum(is.na(diamonds[,i]))
}
print(na_counts)

par(mfrow=c(2,5))
for(i in 1:ncol(diamonds)){
  boxplot(diamonds[,i], main=names(diamonds)[i], col="steelblue")
}

table(diamonds$cut)
ggplot(data=diamonds) +
  geom_bar(aes(cut, color=cut))

table(diamonds$color)
ggplot(data=diamonds) +
  geom_bar(aes(x=color,y=..prop.., group=1)) # y=..prop.. let you see the distribution in proportion, not in value

table(diamonds$clarity)
ggplot(data=diamonds) +
  geom_bar(aes(clarity, fill=clarity))
ggplot(data=diamonds) +
  geom_bar(aes(clarity, fill=cut))
ggplot(data=diamonds) +
  geom_bar(aes(clarity, fill=cut), alpha=1/5, position="identity")
ggplot(data=diamonds) +
  geom_bar(aes(clarity, fill=cut), position="fill")
ggplot(data=diamonds) +
  geom_bar(aes(clarity, fill=cut), position="dodge")


par(mfrow=c(1,1))
hist(diamonds$price, col="steelblue")


# Correlation plot between carat, cut and price
# Observation: carat is prioritized over cut in determining the price
ggplot(data=diamonds, aes(x=carat,y=price)) +
  geom_point(aes(color=cut))

# Correlation plot between carat, color and price
# Observation: carat is also prioritized over color in determining the price
ggplot(data=diamonds, aes(x=carat,y=price)) +
  geom_point(aes(color=color))

# Correlation plot between carat, clarity and price
# Observation: Carat is also prioritized over clarity in determining the price
ggplot(data=diamonds, aes(x=carat,y=price)) +
  geom_point(aes(color=clarity))

# Observation after three plots: There are not much high cut, well-colored and nice clarity diamonds in the group of over 3 to 4 carats

