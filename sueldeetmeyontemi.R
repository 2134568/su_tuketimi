
install.packages("ggplot2")
install.packages("readxl")


library(ggplot2)
library(readxl)

Sys.setlocale("LC_ALL", "Turkish")

su_elde_etme_yontemi <- read_excel("su_elde_etme_yontemi.xlsx")

yontem_sayilari <- as.data.frame(table(su_elde_etme_yontemi$Su_Yontemi))
colnames(yontem_sayilari) <- c("Yontem", "Sayisi")


ggplot(yontem_sayilari, aes(x = "", y = Sayisi, fill = Yontem)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  labs(title = "Su Elde Etme Yöntemlerinin Dağılımı") +
  theme_void() +
  theme(legend.title = element_blank())