library(tidyverse)
library(tribble)
read_csv("fall_2024_midterm_dataset.txt")
text <- read_lines(
  "fall_2024_midterm_dataset.txt",
  skip = 2
)
view(text)

data_tribble <- tribble(
  ~"mode of commute", ~"number of people",
  "car", 6532,
  "public transit", 2657,
  "walking", 809,
  "biking", 512,
  "other", 945
)
ggplot(data = data_tribble, mapping = aes(x = `mode of commute`, y = `number of people`)) +
  geom_col()


install.packages("nycflights13")
library(nycflights13)
highest_delay <- flights |>
  group_by(dest) |>
  summarise(mean_delay = mean (dep_delay, na.rm = TRUE),
            mean_delay = mean (dep_delay, na.rm = TRUE))|>
  arrange(-mean_delay)
view(highest_delay)


install.packages("fivethirtyeight")
library(fivethirtyeight)
view(fandango)
new_fandango <- fandango |>
  select('rt_norm','imdb_norm')|>
  pivot_longer(
    cols = c('rt_norm','imdb_norm'),
    names_to = "review",
    values_to = "rating"
  )


ggplot(new_fandango, aes(x = rating, color = review)) +
  geom_density(linewidth = 0.75)