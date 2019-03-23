library(nycflights13)
library(tidyverse)

view(flights)

na_count <- vector(mode="integer", length=ncol(flights))
for(i in 1:ncol(flights)){
  na_count[i] <- sum(is.na(flights[i]))
}
names(na_count) <- names(flights)
print(na_count)

str(flights)
summary(flights)
head(flights,10)

df1 <- filter(flights,month==1,day==1)
view(df1)

df1 <- filter(flights,month %in% c(11,12))
df2 <- filter(flights, between(month,11,12))
view(df1)
view(df2)

df1 <- filter(flights, arr_delay>=2)
view(df1)

df1 <- filter(flights, dest=='IAH'|dest=='HOU')
view(df1)

df1 <- filter(flights, dep_delay==0, arr_delay>=2)
view(df1)

dep_na_count <- sum(is.na(flights$dep_time))
dep_na_count

df2 <- arrange(flights, day, month, year)
view(df2)

df2 <- arrange(flights, desc(day))
view(df2)

df2 <- arrange(flights, desc(is.na(dep_time)))
view(df2)

df2 <- arrange(flights, desc(arr_delay))
view(df2)

df2 <- filter(df2, dep_time==min(dep_time))
view(df2)
