
install.packages("ggplot2")
library(ggplot2)
library(tidyr)
Sys.setlocale("LC_ALL", "Turkish")
library(readxl)
yillaragore <- read_excel("yillaragore.xlsx")
View(yillaragore)

colnames(yillaragore) <- c("Ulke", "1990lar", "2020")

su_tuketimi_long <- pivot_longer(yillaragore, cols = c("1990lar", "2020"), 
                                 names_to = "Yıl", values_to = "Su Miktarı")


ggplot(su_tuketimi_long, aes(x = Yıl, y = `Su Miktarı`, group = Ulke, color = Ulke)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(title = "Kişi Başına Düşen Su Miktarı (1990'lar vs 2020)",
       x = "Yıl",
       y = "Kişi Başına Su Miktarı (m3)",
       color = "Ülke") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))