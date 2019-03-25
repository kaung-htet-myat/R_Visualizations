library(nycflights13)
library(tidyverse)

# pre-checking the data

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

################################################################################
# filter() function testing

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

################################################################################

dep_na_count <- sum(is.na(flights$dep_time))
dep_na_count

################################################################################
# arrange() function testing

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

################################################################################
# select() function testing

df3 <- select(flights, dep_time,arr_time)
view(df3)

df3 <- select(flights, dep_time:arr_delay)
view(df3)

################################################################################
# rename() function testing

df4 <- rename(flights, deptime=dep_time)
view(df4)

df4 <- select(flights, tailnum, flight, everything())
view(df4)

df4 <- select(flights, tailnum, tailnum)
view(df4)

df4 <- select(flights, contains("TIME"))
view(df4)


flight_mod <- select(flights, year:day, ends_with("delay"), distance, air_time)
view(flight_mod)

################################################################################
# mutate() function testing

df5 <- mutate(flight_mod, gain=dep_delay-arr_delay, speed=distance/air_time*60, hour=air_time/60, gain_per_hour=gain/hour)
view(df5)

################################################################################
# summarise() function testing

df6 <- summarise(flights, delay=mean(arr_delay, na.rm=TRUE))
view(df6)

grp_by <- group_by(flights,year,month,day)
view(grp_by)
df6 <- summarise(grp_by, delay=mean(arr_delay, na.rm=TRUE))
view(df6)

################################################################################
# summarising and plotting flights by distance and delay (without pipeline)

by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

################################################################################
# summarising and plotting flights by distance and delay (with pipeline)

delay <- flights %>%
          group_by(dest) %>%
          summarise(
            count=n(),
            dist=mean(distance, na.rm=TRUE),
            delay=mean(arr_delay, na.rm=TRUE)
          ) %>%
          filter(count>20,dest!='HNL')

ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

################################################################################