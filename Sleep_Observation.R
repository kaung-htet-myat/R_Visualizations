library(ggplot2)

data()
data(sleep)

summary(sleep)
str(sleep)
head(sleep,10)

df <- data.frame(sleep["ID"],sleep["extra"],sleep["group"])
head(df)

par(mfrow=c(1,1))
boxplot(df["extra"], main=names(df["extra"]))

ggplot(df) +
  geom_point(aes(x=group, y=extra))


############### Example Analysis ####################################

require(stats)
## Student's paired t-test
with(sleep,
     t.test(extra[group == 1],
            extra[group == 2], paired = TRUE))

## The sleep *prolongations*
sleep1 <- with(sleep, extra[group == 2] - extra[group == 1])
summary(sleep1)
stripchart(sleep1, method = "stack", xlab = "hours",
           main = "Sleep prolongation (n = 10)")
boxplot(sleep1, horizontal = TRUE, add = TRUE,
        at = .6, pars = list(boxwex = 0.5, staplewex = 0.25))
