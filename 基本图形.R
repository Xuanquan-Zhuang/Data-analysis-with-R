#==========================================================
# An Introduce of Rplot from R in Action
#==========================================================

#-----------------------------------------
# 1. barplot(height)
#    height may be a vector or a matrix
#-----------------------------------------
library(vcd) # use this package to abtain
             # the data Arthritis
counts<-table(Arthritis$Improved)
counts

parset<-par(mfrow=c(1,2))
barplot(counts,main="Simple Bar Plot",
        xlab="Improvement",ylab="Frequency")
barplot(counts,main="Horizontal Bar Plot",
        xlab="Frequency",ylab="Improvement",
        horiz=T)
par(parset)

# Since that Arthritis$Improved is a factor variable, we
# can use it directly instead of changing it into a table.
parset<-par(mfrow=c(1,2))
barplot(Arthritis$Improved,main="Simple Bar Plot",
        xlab="Improvement",ylab="Frequency")
barplot(Arthritis$Improved,main="Horizontal Bar Plot",
        xlab="Frequency",ylab="Improvement",
        horiz=T)
par(parset) # the same result as the code above

# occations when height is a matrix
counts<-table(Arthritis$Improved,Arthritis$Treatment)
counts

parset<-par(mfrow=c(1,2))
barplot(counts,main="Stack Bar Plot",
        xlab="Treatment",ylab="Treatment",
        col=c("red","yellow","green"),
        legend=rownames(counts))
barplot(counts,main="Grouped Bar Plot",
        xlab="Treatment",ylab="Frequency",
        col=c("red","yellow","green"),
        legend=rownames(counts),beside=TRUE)
par(parset)

# more settings about barplot
parset<-par(mar=c(5,8,4,2),las=2)
counts<-table(Arthritis$Improved)

barplot(counts,main="Treatment Outcome",
        horiz=TRUE,cex.names=0.8,
        names.arg=c("No Improvement","Some Improvement",
                    "Marked Improvement"))

# spinogram
library(vcd) # function spine() is provided by this package
attach(Arthritis)
counts<-table(Treatment,Improved)
spine(counts,main="Spinogram Example")
detach(Arthritis)

#-----------------------------------------
# 2. pie(x,labels)
#    x may be a vector of non-negative 
#    numbers
#-----------------------------------------
parset<-par(mfrow=c(2,2))

slices<-c(10,12,4,16,8)
lbls<-c("US","UK","Australia","Germany","France")

pie(slices,labels=lbls,main="Simple Pie Chart")

pct<-round(slices/sum(slices)*100)
lbls2<-paste(lbls," ",pct,"%",sep="")
pie(slices,labels=lbls2,col=rainbow(length(lbls2)),
    main="Pie Chart with Percentages")

library(plotrix)
pie3D(slices,labels=lbls,explode=0.1,main="3D Pie Chart")

mytable<-table(state.region)
lbls3<-paste(names(mytable),"\n",mytable,sep="")
pie(mytable,labels=lbls3,
    main="Pie Chart from a Table\n (with sample sizes)")

par(parset)

# fan plot
library(plotrix) # function fan.plot() is 
                 # provided by this package

slices<-c(10,12,4,16,8)
lbls<-c("US","UK","Australia","Germany","France")

fan.plot(slices,labels=lbls,main="Fan Plot")

#-----------------------------------------
# 3. hist(x)
#    x may be a vector
#-----------------------------------------
parset<-par(mfrow=c(2,2))

hist(mtcars$mpg)

hist(mtcars$mpg,breaks=12,col="red",xlab="Miles Per Gallon",
     main="Colored histogram with 12 bins")

hist(mtcars$mpg,freq=FALSE,breaks=12,col="red",
     xlab="Miles Per Gallon",main="Histogram, rug plot, density curve")
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg,col="blue",lwd=2))

x<-mtcars$mpg
h<-hist(x,breaks=12,col="red",xlab="Miles Per Gallon",
        main="Histogram with normal curve and box")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit<-yfit*diff(h$mids[1:2])*length(x)
lines(xfit,yfit,col="blue",lwd=2)
box()

par(parset)

#-----------------------------------------
# 4. plot(density(x))
#    x may be a vector
#-----------------------------------------
parset<-par(mfrow=c(2,1))

d<-density(mtcars$mpg)
plot(d)

plot(d,main="Kernel Density of Miles Per Gallon")
polygon(d,col="red",border="blue")
rug(mtcars$mpg,col="brown")

par(parset)

# Kernel Density Plot for comparison
parset<-par(lwd=2)
library(sm)
attach(mtcars)

cyl.f<-factor(cyl,levels=c(4,6,8),labels=c("4 cylinder",
                                           "6 cylinder",
                                           "8 cylinder"))
sm.density.compare(mpg,cyl,xlab="Miles Per Gallon")
title(main="MPG Distribution by Car Cylinders")

colfill<-c(2:(1+length(levels(cyl.f))))
legend(locator(1),levels(cyl.f),fill=colfill)

detach(mtcars)
par(parset)

#-----------------------------------------
# 5. boxplot(x)
#    x may be a vector
#-----------------------------------------
boxplot(mtcars$mpg,main="Box plot",ylab="Miles per Gallon")

# show the quantiles
boxplot.stats(mtcars$mpg)

boxplot(mpg~cyl,data=mtcars,main="Car Mileage Data",
        xlab="Number of Cylinders",ylab="Miles Per Gallon")

boxplot(mpg~cyl,data=mtcars,main="Car Mileage Data",
        ylab="Number of Cylinders",xlab="Miles Per Gallon",
        varwidth=TRUE,horizontal=TRUE)

boxplot(mpg~cyl,data=mtcars,notch=TRUE,varwidth=TRUE,col="red",
        main="Car Mileage Data",xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

mtcars$cyl.f<-factor(mtcars$cyl,levels=c(4,6,8),
                     labels=c("4","6","8"))
mtcars$am.f<-factor(mtcars$am,levels=c(0,1),
                    labels=c("auto","standard"))
boxplot(mpg~am.f*cyl.f,data=mtcars,varwidth=TRUE,
        col=c("gold","darkgreen"),
        main="MPG Distribution by Auto Type",
        xlab="Auto Type")

library(vioplot)
x1<-mtcars$mpg[mtcars$cyl==4]
x2<-mtcars$mpg[mtcars$cyl==6]
x3<-mtcars$mpg[mtcars$cyl==8]
vioplot(x1,x2,x3,
        names=c("4 cyl","6 cyl","8 cyl"),
        col="gold")
title("Violin Plots of Miles Per Gallon")

#-----------------------------------------
# 6.dotchart(x,labels=)
#   x may be a vector
#-----------------------------------------
dotchart(mtcars$mpg,labels=row.names(mtcars),cex=.7,
         main="Gas Mileage for Car Models",
         xlab="Miles Per Gallon")

x<-mtcars[order(mtcars$mpg),]
x$cyl<-factor(x$cyl)
x$color[x$cyl==4]<-"red"
x$color[x$cyl==6]<-"blue"
x$color[x$cyl==8]<-"darkgreen"
dotchart(x$mpg,labels=row.names(x),cex=.7,
         groups=x$cyl,gcolor="black",color=x$color,pch=19,
         main="Gas Mileage for Car Models\n grouped by cylinder",
         xlab="Miles Per Gallon")