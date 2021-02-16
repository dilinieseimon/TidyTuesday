library(tidytuesdayR)
library(tidyverse)
library(here)
library(ggimage)
library(showtext)

#install fonts on local environment first
font.add("Vasarely-light", "vasarely-light.otf")
font.add("Bou-College", "Bou-College.ttf")
showtext.auto()

dubois_data <- tidytuesdayR::tt_load('2021-02-16')

plot <- dubois_data$georgia_pop %>%
  pivot_longer(cols = -Year,
               names_to = "population",
               values_to = "Percent") %>%
  ggplot(aes(x = Year,
             y = Percent,
             linetype = population)) +
  geom_line(size = 0.5) +
  scale_y_reverse(limits = c(100,0), expand = c(0,0),
                  breaks = seq(100, 0, by = -5)) +
  scale_x_continuous(limits = c(1790, 1890), expand = c(0, 0),
                     breaks = seq(1790, 1890, by = 10)) +
  coord_flip() +
  theme(text=element_text(family="Vasarely-light", size = 8, colour = "#654321"),
        legend.title = element_blank(),
        legend.position="bottom",
        legend.key.width = unit(2, "cm"),
        legend.text = element_text(margin = margin(r = 1.5, unit = "cm")),
        axis.ticks = element_blank(),
        axis.text.y = element_text(size = 10),
        panel.background = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(colour = "#EC8569"),
        panel.border = element_blank(),
        plot.margin = margin(30,80,20,80),
        plot.title = element_text(family="Bou-College", size = 15, hjust = 0.5)) +
  labs(x = "",
       y = "PERCENTs",
       title = "COMPARATIVE INCREASE OF WHITE AND COLORED\nPOPULATION OF GEORGIA.\n")


ggbackground(plot, here("Dubois-Challenge/georgia_population_change_by_race_bg.jpg"))
