library(ggplot2)
library(grid)
library(showtext)
library(Cario)
font.add("myfont","msyh.ttc")

mydata <- data.frame(
  id = 1:13,
  class = rep_len(1:4,length = 13),
  label = c("Events","Lead List","Partner","Marketing & Advertising","Tradeshows",
            "Paid Search","Weblinar","Emial Campaign","Sales generated","Website",
            "Other","Facebool/Twitter/\nOther Social","Employee & Customer\nReferrals"),
  value = c(7.6,15.5,17.9,21.8,29.6,29.7,32.7,43.0,57.5,61.4,67.4,68.6,68.7)
)