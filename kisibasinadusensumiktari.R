
library(ggplot2)
library(readxl)
Sys.setlocale("LC_ALL", "Turkish")

su_tuketimi <- read_excel("kisibasinadusensumiktari.xlsx")


ggplot(su_tuketimi, aes(x = Ulke, y = Kisibasinadusensumiktari, color = Ulke)) +
  geom_point(size = 3) +  
  theme_minimal() +
  labs(title = "Kişi Başına Düşen Su Miktarı",
       x = "Ülke",
       y = "Kişi Başına Su Miktarı (m??)",
       color = "Ülke") +  
  theme(axis.text.x = element_text(angle = 45, hjust = 1))