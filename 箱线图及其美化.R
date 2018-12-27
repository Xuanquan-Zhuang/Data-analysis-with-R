#====================================
# 箱线图及其美化技巧
# 以ggplot2内置数据集为例
#====================================
library(ggplot2)
library(ggthemes)

head(mpg)

summary(mpg)

str(mpg)

ggplot(mpg,aes(class,displ))+
  geom_boxplot()

ggplot(diamonds,aes(cut,price,fill=color))+
  geom_boxplot()

ggplot(diamonds,aes(cut,price,fill=color,alpha=1/30))+
  geom_boxplot(position="identity")

ggplot(diamonds,aes(cut,price,fill=color))+
  geom_boxplot(position="dodge")

ggplot(diamonds,aes(cut,price,fill=color))+
  geom_boxplot()+
  facet_grid(.~color)

ggplot(diamonds,aes(cut,price,fill=color))+
  geom_boxplot()+
  facet_wrap(~color)

ggplot(diamonds,aes(cut,price,fill=color))+
  geom_boxplot()+
  ggtitle("Box Plot")+
  theme_wsj()+
  scale_fill_wsj()+
  guides(fill=guide_legend(title=NULL))

ggplot(diamonds,aes(cut,price,fill=color))+
  geom_boxplot()+
  ggtitle("Box Plot")+
  theme_economist()+
  scale_fill_economist()+
  guides(fill=guide_legend(title=NULL))

ggplot(diamonds,aes(cut,price,fill=color))+
  geom_boxplot()+
  ggtitle("Box Plot")+
  theme_wsj()+
  scale_fill_wsj()+
  guides(fill=guide_legend(title=NULL))+ 
  facet_grid(.~color)

ggplot(diamonds,aes(cut,price,fill=color))+
  geom_boxplot()+
  ggtitle("Box Plot")+
  theme_economist()+
  scale_fill_economist()+
  guides(fill=guide_legend(title=NULL))+
  facet_grid(.~color)

