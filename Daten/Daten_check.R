
# Masterarbeit Kira Zimmermann
## Datencheck






# packages
library(readr)
library(tidyr)
library(tidyverse)
library(ggplot2)
library(dplyr)




# import
df <- read_csv("C:/Users/sw.admin/Desktop/kira/Masterarbeit/Daten/stephen ma zimmermann/ph15.csv", col_names = FALSE, skip = 2) %>% 
  dplyr::select(date = X2, abstich = X3, temp_water = X4, bat_v = X5, temp_air = X6, rel_hum = X7) %>% 
  tidyr::drop_na(date) %>% 
  tidyr::pivot_longer(cols = c("abstich", "temp_water","bat_v", "temp_air","rel_hum"), 
                      names_to = "parameter", values_to = "value")


ggplot(df, aes(y = value, x =lubridate::dmy_hms(date), color = parameter)) +
  geom_point()


