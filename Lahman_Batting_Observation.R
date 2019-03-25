library(tidyverse)
library(Lahman)

batting <- as_tibble(Lahman::Batting)
view(batting)
view(arrange(batting,playerID))


batters <- batting %>%
            group_by(playerID) %>%
            summarise(
              ba = sum(H,na.rm=TRUE)/sum(AB,na.rm=TRUE),
              ab = sum(AB,na.rm=TRUE)
            )

batters %>%
  filter(ab>100) %>%
  ggplot(aes(x=ab,y=ba)) +
  geom_point(alpha=1/10) +
  geom_smooth (se=FALSE)

# From this observation, we can see that we cannot decide who the best batter or who the worst by looking
# at the small 'at bat' counts. The skill of a player can only be decided after a long observations over
# more 'at bat' counts. 
# So, when we want to build models upon this type of data, we have to do 'empirical Bayesian shrinkage
# towards a beta prior'.