#==============================================
# ggplot2 histogram
# use ggplot2 to create elegant histograms
# 2017/6/7
#==============================================
set.seed(100)
d <- data.frame(x = rnorm(2000))

library(ggplot2)

ggplot(d,aes(x))+
  geom_histogram(bins = 50) # ordinary histogram

ggplot(d,aes(x,fill = cut(x,100)))+
  geom_histogram(bins = 50) # cut(): convert numeric to factor(cut a vector into n factors)
                            # fill =: fill different intervals with diffrent colors

ggplot(d,aes(x,fill = cut(x,100)))+
  geom_histogram(bins = 50,show.legend = FALSE) # remove legend

ggplot(d,aes(x,fill = cut(x,100)))+
  geom_histogram(bins = 50,show.legend = FALSE)+
  scale_fill_discrete(h = c(240,10),c = 120,l = 70) # h =: range of hues to use, in [0,360]
                                                    # c =: chroma(intensity of colour)
                                                    # l =: luminance(lightness),in [0,100]

ggplot(d,aes(x,fill = cut(x,100)))+
  geom_histogram(bins = 50,show.legend = FALSE)+
  scale_fill_discrete(h = c(240,10),c = 120,l = 70)+
  theme_minimal()+
  labs(x = "Variable X",y = "n")+
  ggtitle("Histogram of X") # theme_...(): set theme
                            # labs(): set labels name
                            # ggtitle(): provide a title

p <- ggplot(d,aes(x,fill = cut(x,100)))+
  geom_histogram(bins = 50,show.legend = FALSE)+
  labs(x = "Variable X",y = "n")+
  ggtitle("Histogram of X",subtitle = "Created by Messiah")+
  labs(caption = "2017/6/7")

p + scale_fill_discrete(h = c(180,360),c = 150,l = 80)+
  theme(panel.background = element_rect(fill = "black"),
        plot.background = element_rect(fill = "black"),
        plot.title = element_text(colour = "blue"),
        plot.subtitle = element_text(colour = "blue"),
        plot.caption = element_text(colour = "blue"),
        axis.line = element_line(colour = "grey80"),
        axis.text = element_text(colour = "blue"),
        axis.title = element_text(colour = "grey80"))