library(tidyverse)

bike <- read_csv("data/bikeshare-day.csv")

bike <- bike %>%
  mutate(
    season = case_when(
      season == 1 ~ "Winter",
      season == 2 ~ "Spring",
      season == 3 ~ "Summer",
      season == 4 ~ "Fall"
    ),
    season = fct_relevel(season, "Winter", "Spring", "Summer", "Fall")
  )

ggplot(data = bike, aes(x = season, y = cnt)) +
  geom_boxplot() +
  labs(
    x = "Season",
    y = "Daily bike rentals",
    title = "Daily bike rentals throughout seasons"
  ) +
  theme_minimal()

ggsave(file = "bike-season-box.png", width = 7, height = 4)

ggplot(data = bike, aes(x = cnt, fill = season, color = season)) +
  geom_density(alpha = 0.3) +
  labs(
    x = "Daily bike rentals",
    y = "Density",
    title = "Daily bike rentals throughout seasons"
  ) +
  theme_minimal()

ggsave(file = "bike-season-density.png", width = 7, height = 4)
