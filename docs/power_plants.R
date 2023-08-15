# Data wrangling and viz

library(tidyverse)
library(here)
library(janitor)

power_plants <- read_csv(here("data", "power_plants.csv")) %>%
  clean_names()

alabama_plants <- power_plants %>%
  filter(state_name == "Alabama")

alabama_plot <- ggplot(alabama_plants, aes(x = install_mw, y = total_mw)) +
  geom_point()

ggsave(filename = here("figs", "alabama_plants.jpg"), plot = alabama_plot)
