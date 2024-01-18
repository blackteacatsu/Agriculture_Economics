#### Setup ####
getwd() # get working directory
setwd("/Users/kris/GitHub/Agriculture_economics/code")

### Data loading ###
fertilizer <- read.csv("/Users/kris/GitHub/Agriculture_economics/Fertilizer/nitrogen-fertilizer-application-per-hectare-of-cropland.cleaned.csv")

hhunger <- read.csv("/Users/kris/GitHub/Agriculture_economics/human_dev/hidden-hunger-index-vs-gdp-per-capita.cleaned.csv")

humancap <- read.csv("/Users/kris/GitHub/Agriculture_economics/human_dev/human-capital-index-vs-gdp.cleaned.csv")

pesticide <- read.csv("/Users/kris/GitHub/Agriculture_economics/Pesticide/pesticide-use-tonnes.cleaned.csv")

humandev <- read.csv("/Users/kris/GitHub/Agriculture_economics/human_dev/human-development-index-vs-gdp-per-capita.cleaned.csv")


library(viridis)
library(ggplot2) # load ggplot lib to envi.
library(gridExtra)
library(gganimate)
library(magick)
library(gganimate)
library(gifski)

head(fertilizer)
head(hhunger)
head(pesticide)


class(fertilizer)

### P1 ###
plt <- ggplot(data = fertilizer) + 
  geom_point(mapping = aes(x = Year,  y = Fertilizer.use, col = Entity)) +
  scale_color_viridis(discrete = TRUE, option = "turbo") +
  labs(title = "Use of Nitrogen Fertilizer in countries by years",
       subtitle = "Using geom_point",
       tag = "A",
       x = "Years", y = "Use of Nitrogen Fertilizers (Kg per hectare)")
plt

plt1 <- ggplot(data = fertilizer) + 
  geom_line(mapping = aes(x = Year,  y = Fertilizer.use, col = Entity)) +
  scale_color_viridis(discrete = TRUE, option = "turbo") +
  labs(title = "Use of Nitrogen Fertilizer in countries by years",
       subtitle = "Using geom_line",
       tag = "B",
       x = "Years", y = "Use of Nitrogen Fertilizers (Kg per hectare)") + 
  transition_reveal(Year)
plt1

png('fertilizer_use.png', 
    width = 10, height = 10, units = "in", res = 400)
grid.arrange(plt, plt1, ncol=1, nrow=2)
dev.off()



animate(plt1, duration = 10, fps = 20, width = 12, height = 6, unit = "in", 
        res = 200, renderer = gifski_renderer())
anim_save("plt1.gif")



### ###

plt2 <- ggplot(data = hhunger) + 
  geom_count(mapping = aes(x = Entity,  y = hhungerindex, col = Entity, size = Fertilizer.use)) +
  scale_color_viridis(discrete = TRUE, option = "turbo") +
  labs(title = "Use of Nitrogen Fertilizer in countries by years",
       caption = "Note: Fertilizer.use is in ",
       x = "Hidden hunger index", y = "Use of Nitrogen Fertilizers")
plt2

### ###

plt3 <- ggplot(data = pesticide) + 
  geom_point(mapping = aes(x = Pesticide.use, y = Fertilizer.use, col = Entity), size = 3) +
  scale_color_viridis(discrete = TRUE, option = "turbo") +
  labs(x = "Total Pesticide use (Tonnes)", y = "Use of Nitrogen Fertilizers (Kg per hectare)") +
  transition_time(Year) +
  labs(title = "Fertilizer and Pesticide use in {frame_time}") +
  shadow_wake(wake_length = 0.1, alpha = FALSE)

animate(plt3, duration = 10, fps = 20, width = 5, height = 5, unit = "in", 
        res = 150, renderer = gifski_renderer())
anim_save("plt3.gif")

### ###
plt4 <- ggplot(data = humandev) + 
  geom_point(mapping = aes(x = Pesticide.use, y = Fertilizer.use, col = Entity, size = Human.Development.Index)) +
  scale_color_viridis(discrete = TRUE, option = "turbo") +
  labs(x = "Total Pesticide use (Tonnes)", y = "Use of Nitrogen Fertilizers (Kg per hectare)") +
  transition_time(Year) +
  labs(title = "Fertilizer and Pesticide use in {frame_time}") +
  shadow_wake(wake_length = 0.1, alpha = FALSE)

animate(plt4, duration = 8, fps = 20, width = 8, height = 5, unit = "in", 
        res = 150, renderer = gifski_renderer())
anim_save("plt4.gif")


plt5 <- ggplot(humandev, aes(Year, Human.Development.Index, color = Entity)) +
  geom_line() +
  scale_color_viridis_d(option = "turbo") +
  labs(x = "Year", y = "Human Development Index", title = "Change in Human Development Index since 1990") +
  theme(legend.position = "top") + 
  geom_point() +
  transition_reveal(Year)

animate(plt5, duration = 5, fps = 20, width = 5, height = 5, unit = "in", 
        res = 150, renderer = gifski_renderer())
anim_save("plt5.gif")



