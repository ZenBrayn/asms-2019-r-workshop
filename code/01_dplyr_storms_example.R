# dplyr examples using the 'storms' data set
library(dplyr)

# We’ll use the dplyr built in ‘storms’ data set
View(storms)


# Example dplyr pipeline
# Question: What is the mean wind speed and air pressure for each year?
mean_stats <- storms %>%
  group_by(year) %>%
  summarize(mean_wind_speed = mean(wind),
            mean_air_pressure = mean(pressure)) %>%
  arrange(desc(mean_wind_speed))

View(mean_stats)

# It's easy to add more summary statistics
mean_stats_2 <- storms %>%
  group_by(year) %>%
  summarize(mean_wind_speed = mean(wind),
            mean_air_pressure = mean(pressure),
            sd_wind_speed = sd(wind),
            sd_air_pressure = sd(pressure)) %>%
  arrange(desc(mean_wind_speed))

View(mean_stats_2)


# New Question: Which storm had the highest mean wind speed?
# Just group by name too!
mean_stats_3 <- storms %>%
  group_by(name, year) %>%
  summarize(mean_wind_speed = mean(wind),
            mean_air_pressure = mean(pressure),
            sd_wind_speed = sd(wind),
            sd_air_pressure = mean(pressure)) %>%
  arrange(desc(mean_wind_speed))

View(mean_stats_3)
