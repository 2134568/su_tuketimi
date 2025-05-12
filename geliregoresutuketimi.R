library(ggplot2)
library(ggrepel)
library(readxl)

Sys.setlocale("LC_ALL", "Turkish")

# Excel dosyasD1nD1 oku
veri <- read_excel("G20_Su_Tuketimi_Gelir.xlsx")
names(veri) <- c("Ulke", "GelirGrubu", "SuTuketimi")  # Kolon adlarD1nD1 sadeleEtir

# Grafik
ggplot(veri, aes(x = GelirGrubu, y = SuTuketimi, fill = GelirGrubu)) +
  geom_boxplot() +
  geom_text_repel(aes(label = Ulke),
                  size = 4,
                  color = "black",
                  fontface = "bold",
                  box.padding = 0.5,
                  max.overlaps = 20,
                  direction = "both",
                  show.legend = FALSE) +
  labs(
    title = "Gelir Gruplarına Göre Su Tüketimi Dağılımı",
    x = "Gelir Grubu",
    y = "Su Tüketimi (m3/yıl)"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))