install.packages("ggplot2")
install.packages("tidyr")
install.packages("readxl")

library(ggplot2)
library(tidyr)
library(readxl)

Sys.setlocale("LC_ALL", "Turkish")


sektorel <- read_excel("sektorel.xlsx")


colnames(sektorel)

colnames(sektorel) <- gsub(" ", "_", colnames(sektorel))  
colnames(sektorel) <- gsub("%", "", colnames(sektorel))    

colnames(sektorel)

su_verisi_long <- pivot_longer(
  sektorel,
  cols = c("Tarım", "Sanayi", "Evsel_Kullanım"),
  names_to = "Kullanim_Tipi",
  values_to = "Yuzde"
)

ggplot(su_verisi_long, aes(x = reorder(Ülke, -Yuzde), y = Yuzde, fill = Kullanim_Tipi)) +
  geom_bar(stat = "identity") +
  coord_flip() +  
  labs(
    title = "Sektörel Su Kullanım Dağılımı",
    x = "Ülke", y = "Kullanım Yüzdesi (%)",
    fill = "Kullanım Tipi"
  ) +
  scale_fill_manual(values = c("Tarım" = "#66c2a5", "Sanayi" = "#fc8d62", "Evsel_Kullanım" = "#8da0cb")) +
  theme_minimal(base_size = 13)