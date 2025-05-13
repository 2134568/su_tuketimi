library(ggplot2)
library(readxl)
library(scales)


Sys.setlocale("LC_ALL", "Turkish")
kisibasinadusensumiktari <- read_excel("kisibasinadusensumiktari.xlsx")


ggplot(kisibasinadusensumiktari, aes(x = yuzolcumu, y = kisibasinadusensumiktari, colour = Ulke, size = yuzolcumu)) +
  geom_point(alpha = 0.8) +
  theme_minimal() +
  scale_x_log10(labels = label_number(accuracy = 1)) +
  scale_y_continuous(labels = label_number(accuracy = 1)) +
  labs(
    title = "Ülkelerin Yüz Ölçümü ve Kişi Başına Su Miktarı",
    x = "Yüz Ölçümü (km²)",
    y = "Kişi Başına Su Miktarı (m³)",
    color = "Ülke"
  ) +
  guides(size = "none") +  
  theme(axis.text.x = element_text(angle = 45, hjust = 1))