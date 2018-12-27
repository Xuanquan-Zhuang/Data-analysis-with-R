#===========================================
# R语言可视化——散点图及其美化技巧
# 使用R语言自带数据集diamonds
#===========================================
library(ggplot2)
library(ggthemes)

head(diamonds)

summary(diamonds)

nrow(diamonds)

ggplot(diamonds,aes(carat,price))+
  geom_point()

ggplot(diamonds,aes(carat,price))+
  geom_point(aes(shape = cut))

ggplot(diamonds,aes(carat,price))+
  geom_point(aes(colour = cut))

ggplot(diamonds,aes(carat,price))+
  geom_point(aes(size = cut))

ggplot(diamonds,aes(carat,price))+
  geom_point(alpha = 1/10)

ggplot(diamonds,aes(carat,price))+
  geom_point(shape = ".")

ggplot(diamonds,aes(carat,price))+
  geom_point(aes(colour = cut))+
  ggtitle("Scatter plot")+
  theme_economist(base_size = 14)+
  scale_colour_economist()+
  guides(colour = guide_legend(title = NULL))

ggplot(diamonds,aes(carat,price))+
  geom_point(aes(colour = cut))+
  ggtitle("Scatter plot")+
  theme_wsj()+
  scale_colour_wsj()+
  guides(colour = guide_legend(title = NULL))

ggplot(diamonds,aes(carat,price))+
  geom_point(aes(colour = cut))+
  ggtitle("Scatter plot")+
  theme_wsj()+
  scale_colour_wsj()+
  guides(colour = guide_legend(title = NULL))+
  geom_smooth(method = "lm")+
  ylim(0,25000)
