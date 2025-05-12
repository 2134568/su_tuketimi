library(ggplot2)

Sys.setlocale("LC_ALL", "Turkish")
library(readxl)
su_stresi_verileri <- read_excel("G20_Su_Stresi_Risk_Puani.xlsx")
View(G20_Su_Stresi_Risk_Puani)
getwd()
grafik <- ggplot(su_stresi_verileri, aes(x = reorder(Ülke, `Su Stresi Riski (1-5)`), y = `Su Stresi Riski (1-5)`, fill = Ülke)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Su Stresi Risk Puanı",
       x = "Ülke",
       y = "Su Stresi Riski (1-5)") +
  theme_minimal(base_size = 14) +
  theme(legend.position = "none")


print(grafik)


ggsave("su_kitligi_tr.png", plot = grafik, width = 12, height = 8, dpi = 300)


print(grafik)