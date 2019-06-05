# ggplot2 examples using the 'storms' data set
library(ggplot2)
library(dplyr)

#=== This is the dplyr section from 01_dplyr_storms_example.R
# We’ll use the dplyr built in ‘storms’ data set
storms
tail(storms)

# Example dplyr pipeline
mean_stats <- storms %>%
  group_by(year) %>%
  summarize(mean_wind_speed = mean(wind),
            mean_air_pressure = mean(pressure)) %>%
  arrange(desc(mean_wind_speed))

mean_stats


#=== Now onto the ggplot2 stuff
# qplot examples
p1 <- qplot(mean_stats$year, mean_stats$mean_wind_speed)
p1
p2 <- qplot(mean_stats$mean_wind_speed)
p2

# ggplot examples
# points
p3 <- ggplot(mean_stats, aes(year, mean_wind_speed)) +
  geom_point()
p3

# lines
p4 <- ggplot(mean_stats, aes(year, mean_wind_speed)) +
  geom_line()
p4

# points and lines
p5 <- ggplot(mean_stats, aes(year, mean_wind_speed)) +
  geom_point() +
  geom_line()
p5

# Let's make it a bit nicer
p6 <- ggplot(mean_stats, aes(year, mean_wind_speed)) +
  geom_point(color = "steelblue", size = 4) +
  geom_line(color = "tomato3") +
  labs(
    title = "Mean Wind Speed of Tropical Storms & Hurricans by Year",
    x = "Year",
    y = "Mean Wind Speed"
  )
p6

# We can also add a trend line (statistical summary)
# Look! we can reuse the plot above and add on to it!
p7 <- p6 +
  # This makes a simple linear trend line with 95% CI's
  geom_smooth(method = "lm")
p7

