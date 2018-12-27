#=====================================
# R语言基础作图参数详解
#=====================================

#-------------------------------------
# Example 1
#-------------------------------------
attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)

#-------------------------------------
# save plot to pdf
#-------------------------------------
pdf("mygraph.pdf") # also use win.metafile()/ png()/ jpeg()/ bmp()/ tiff()/ xfig()/ postscript()
attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression of MPG on Weight")
detach(mtcars)
dev.off()

#-------------------------------------
# open a new plot window
#-------------------------------------
dev.new()
plot(seq(0,2*pi,2*pi/100),sin(seq(0,2*pi,2*pi/100)))

dev.new()
plot(seq(0,2*pi,2*pi/100),cos(seq(0,2*pi,2*pi/100)))

dev.prev()
plot(1:100,tan(1:100))

dev.next()
plot(sin(1:100),cos(1:100))

dev.off()

#-------------------------------------
# par(optionname = name,optionname = name,...)
#-------------------------------------
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

plot(dose,drugA,type = "b")

opar <- par(no.readonly = TRUE)
par(lty = 2,pch = 17)
plot(dose,drugA,type = "b")
par(opar)

#-------------------------------------
# different points
#-------------------------------------
plot(rep(1:5,5),rep(1:5,each = 5),pch = 1:25,cex = 2,ylim = c(0,5),xlab = "",ylab = "")
title("Different Points in R Plot")
text(rep(1:5,5),rep(-0.3+(1:5),each = 5),1:25)

#-------------------------------------
# different lines
#-------------------------------------
plot(c(0,3),c(1,1),type = "l",ylim = c(0,6),xlim = c(1,2),lwd = 2,ylab = "lty = ",xlab = "")
abline(h = 2:6,lty = 2:6,lwd = 2)
title("Different Lines in R Plot")

#-------------------------------------
# colour parameters
#---------------------
# col: 默认绘图颜色
# col.axis: 坐标轴刻度文字的颜色
# col.lab: 坐标轴标签的颜色
# col.main: 标题颜色
# col.sub: 副标题颜色
# fg: 图形的前景色
# bg: 图形的背景色
#---------------------
# col = rgb(1,1,1): RGB值
# col = hsv(0,0,1): HSV值
# rainbow()/ heat.colors()/ terrain.colors()/ topo.colors()/ cm.colors()
#---------------------
n <- 10
mycolors <- rainbow(n)
pie(rep(1,n),labels = mycolors,col = mycolors)
mygrays <- gray(0:n/n)
pie(rep(1,n),labels = mygrays,col = mygrays)

#-------------------------------------
# text parameters
#---------------------
# cex: 相对于默认大小缩放的倍数
# cex.axis: 坐标轴刻度文字的缩放倍数
# cex.lab: 坐标轴标签的缩放倍数
# cex.main: 标题的缩放倍数
# cex.sub: 副标题的缩放倍数
#---------------------
# font: 字体样式，1=常规，2=粗体，3=斜体，4=粗斜体，5=符号字体
# font.axis: 坐标轴刻度文字的字体样式
# font.lab: 坐标轴标签的字体样式
# font.main
# font.sub
# ps: 字体磅值
# family: 绘制文本时使用的字体族
#-------------------------------------

#-------------------------------------
# size parameters
#---------------------
# pin: 以英寸表示的图形尺寸（宽和高）
# mai: 以数值向量表示的边界大小，顺序为下、左、上、右，单位为英寸
# mar: 以数值向量表示的边界大小，顺序为下、左、上、右，单位为英分
#---------------------
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

opar <- par(no.readonly = TRUE)
par(pin = c(2,3))
par(lwd = 2,cex = 1.5)
par(cex.axis = .75,font.axis = 3)
plot(dose,drugA,type = "b",pch = 19,lty = 2,col = "red")
plot(dose,drugB,type = "b",pch = 23,lty = 6,col = "blue",bg = "green")
par(opar)

#-------------------------------------
# 某些高级绘图函数已经包含了默认的标题和标签。
# 可以通过在plot()或单独的par()语句中添加ann = FALSE
# 来移除它们
#-------------------------------------

#-------------------------------------
# title parameters
#---------------------
title(main = "My Title",col.main = "red",
      sub = "My Sub-title",col.sub = "blue",
      xlab = "My X label",ylab = "My Y label",
      col.lab = "green",cex.lab = 0.75)
#---------------------
# axis parameters,axis()
#---------------------
# side: 表示在图形的哪边绘制坐标轴（1=下，2=左，3=上，4=右）
# at: 表示需要绘制刻度线的位置
# labels: 表示置于刻度线旁边的文字标签（如果为NULL，则直接使用at中的值）
# pos: 坐标轴线绘制的坐标（与另一条坐标轴相交位置的值）
# lty: 线条类型
# col: 线条和刻度线颜色
# las: 标签是否平行于（=0）或垂直于（=2）坐标轴
# tck: 刻度线的长度，以相对于绘图区域大小的分数表示（负值表示在图形外侧，正值表示在图形内侧，
#      0表示禁用刻度，1表示绘制网格线
#---------------------
x <- c(1:10)
y <- x
z <- 10/x

opar <- par(no.readonly = TRUE)

par(mar = c(5,4,4,8)+0.1)

plot(x,y,type = "b",
     pch = 21,col = "red",
     yaxt = "n",lty = 3,ann = FALSE)

lines(x,z,type = "b",pch = 22,col = "blue",lty = 2)

axis(2,at = x,labels = x,col.axis = "red",las = 0)

axis(4,at = z,labels = round(z,digits = 2),
     col.axis = "blue",las = 2,cex.axis = 0.7,tck = -0.01)

mtext("y = 10/x",side = 4,line = 3,cex.lab = 1,las = 2,col = "blue")

title("An Example of Creatice Axes",
      xlab = "X values",
      ylab = "Y = X")

par(opar)
#---------------------
# sub scale line
#---------------------
library(Hmisc)
# minor.tick(nx = n,ny = n,tick.ratio = n)
# nx和ny分别指定了X轴和Y轴每两条主刻度线之间通过次刻度线
# 划分得到的区间个数，tick.ratio表示次要刻度线相对于主刻
# 度线的大小比例
#---------------------
x <- c(1:10)
y <- x
z <- 10/x

opar <- par(no.readonly = TRUE)

par(mar = c(5,4,4,8)+0.1)

plot(x,y,type = "b",
     pch = 21,col = "red",
     yaxt = "n",lty = 3,ann = FALSE)

lines(x,z,type = "b",pch = 22,col = "blue",lty = 2)

axis(2,at = x,labels = x,col.axis = "red",las = 0)

axis(4,at = z,labels = round(z,digits = 2),
     col.axis = "blue",las = 2,cex.axis = 0.7,tck = -0.01)

mtext("y = 10/x",side = 4,line = 3,cex.lab = 1,las = 2,col = "blue")

title("An Example of Creatice Axes",
      xlab = "X values",
      ylab = "Y = X")

minor.tick(nx = 2,ny = 3,tick.ratio = 0.5)

par(opar)

#-------------------------------------
# legend
#-------------------------------------
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

opar <- par(no.readonly = TRUE)

par(lwd = 2,cex = 1.5,font.lab = 2)

plot(dose,drugA,type = "b",
     pch = 15,lty = 1,col = "red",ylim = c(0,60),
     main = "Drug A vs. Drug B",
     xlab = "Drug Dosage",ylab = "Drug Response")

lines(dose,drugB,type = "b",
      pch = 17,lty = 2,col = "blue")

abline(h = c(30),lwd = 1.5,lty = 2,col = "gray")

library(Hmisc)
minor.tick(nx = 3,ny = 3,tick.ratio = 0.5)

legend("topleft",inset = .05,title = "Drug Type",legend = c("A","B"),
       lty = c(1,2),pch = c(15,17),col = c("red","blue"))

par(opar)

#-------------------------------------
# text()/ mtext()
#---------------------
# location: 文本的位置参数。可为一对x,y坐标，也可以指定location = locator(1)
#           使用鼠标交互地确定摆放位置
# pos: 文本相对于参数的方位
# side: 指定用来放置文本的边
#---------------------
attach(mtcars)
plot(wt,mpg,main = "Mileage vs. Car Weight",
     xlab = "Weight",ylab = "Mileage",
     pch = 18,col = "blue")
text(wt,mpg,row.names(mtcars),
     cex = 0.6,pos = 4,col = "red")
detach(mtcars)

#-------------------------------------
# plot combiantion
#-------------------------------------
attach(mtcars)
opar <- par(no.readonly = TRUE)
par(mfrow = c(2,2))
plot(wt,mpg,main = "Scatterplot of wt vs. mpg")
plot(wt,disp,main = "Scatterplot of wt vs. disp")
hist(wt,main = "Histogram of wt")
boxplot(wt,main = "Boxplot of wt")
par(opar)
detach(mtcars)

attach(mtcars)
opar <- par(no.readonly = TRUE)
par(mfrow = c(3,1))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow = TRUE),
       widths = c(3,1),heights = c(1,2))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

opar <- par(no.readonly = TRUE)
par(fig = c(0,0.8,0,0.8))
plot(mtcars$wt,mtcars$mpg,xlab = "Car Weight",
     ylab = "Miles Per Gallon")
par(fig = c(0,0.8,0.55,1),new = TRUE)
boxplot(mtcars$wt,horizontal = TRUE,axes = FALSE)
par(fig = c(0.65,1,0,0.8),new = TRUE)
boxplot(mtcars$mpg,axes = FALSE)
mtext("Enhanced Scatterplot",side = 3,outer = TRUE,line = -3)
par(opar)

