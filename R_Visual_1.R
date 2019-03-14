library(ggplot2)
data("midwest",package="ggplot2")

ggplot(midwest, aes(x=area,y=poptotal)) +
  geom_point() +
  geom_smooth(method="lm") +
  #xlim(c(0,0.1)) +
  #ylim(c(0,1000000))
  coord_cartesian(xlim(c(0,0.1)), ylim(c(0,1000000)))
