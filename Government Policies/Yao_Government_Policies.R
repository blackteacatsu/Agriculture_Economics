# Effects of Government Policies on Algriculture

library(tidyverse)

expenditures <- read.csv("C:/Users/yaoda/OneDrive/Desktop/JHU/2024 Intersession/EN.580.159.13 Introduction to Data Analysis and Visualization/Agriculture_Economics/Government Policies/2021_FAOSTAT_data_en_1-12-2024.csv")

class(expenditures)
dim(expenditures)
head(expenditures)
summary(expenditures)

GDP_share <- read.csv("C:/Users/yaoda/OneDrive/Desktop/JHU/2024 Intersession/EN.580.159.13 Introduction to Data Analysis and Visualization/Agriculture_Economics/Government Policies/API_NV.AGR.TOTL.ZS_DS2_en_csv_v2_6299253.csv")

class(GDP_share)
dim(GDP_share)
head(GDP_share)
summary(GDP_share)

GDP <- read.csv("C:/Users/yaoda/OneDrive/Desktop/JHU/2024 Intersession/EN.580.159.13 Introduction to Data Analysis and Visualization/Agriculture_Economics/Government Policies/API_NY.GDP.MKTP.CD_DS2_en_csv_v2_6298258.csv")

class(GDP)
dim(GDP)
head(GDP)
summary(GDP)

expenditure_values <- expenditures$"Value"
GDP_values <- GDP$"X2021"

expenditures_per_GDP <- expenditure_values / GDP_values

expenditures_by_country <- expenditures %>% 
  group_by(Area) %>% 
  summarize(total_expenditures = sum(Value))