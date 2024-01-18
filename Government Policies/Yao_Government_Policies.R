# Effects of Government Policies on Algriculture

library(tidyverse)
library(ggplot2)

expenditures <- read.csv("2021_FAOSTAT_data_en_1-12-2024.csv")

GDP_share <- read.csv("API_NV.AGR.TOTL.ZS_DS2_en_csv_v2_6299253.csv")

GDP <- read.csv("API_NY.GDP.MKTP.CD_DS2_en_csv_v2_6298258.csv")

expenditure_values <- expenditures$"Value"
GDP_values <- GDP$"X2021"

expenditures_by_country <- expenditures %>% 
  group_by(Area) %>% 
  summarize(total_expenditures = sum(Value))

include <- GDP$"Country.Name" %in% expenditures_by_country$"Area"

GDP_values_per_country <- GDP[include, ]

include <- expenditures_by_country$"Area" %in% GDP_values_per_country$"Country.Name"
expenditures_by_country <- expenditures_by_country[include, ]
expenditures_by_country

GDP_values_per_country <- GDP_values_per_country$"X2021"
df = data.frame(expenditures_by_country, GDP_values_per_country)

regression <- glm(df$"GDP_values_per_country" ~ df$"total_expenditures")
coefficients <- coef(regression)
x_sample <- c(0, 5e+6)
y_sample <- x_sample*7.286481e+04 + 3.788361e+11
sample_df <- data.frame(x_sample, y_sample)

png("GDPvsAE.png", width = 800, height = 600, res = 72)
ggplot(data = df) +
  geom_point(mapping = aes(x=total_expenditures, y=GDP_values_per_country)) + 
  theme_classic() + 
  labs(title="GDP versus Agricultural Expenditures", x="GDP (USD)", y="Agricultural Expenditures (USD)") +
  geom_line(mapping = aes(x=x_sample, y=y_sample), data=sample_df, color="red")
dev.off()