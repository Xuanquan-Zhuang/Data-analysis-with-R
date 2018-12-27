#==============================================================
# 高级图形进阶
#
# ver2016.4.14
#==============================================================
#--------------------------------------------------------------
# lattice包
# lattice包为单变量和多变量数据的可视化提供了一个全面的图形系统
#--------------------------------------------------------------
library(lattice) # 加载lattice包

head(singer) # lattice包中的singer数据集

histogram(~height|voice.part,data=singer,
          main="Distribution of Heights by Voice Pitch",
          xlab="Height(inches)")

attach(mtcars)

gear<-factor(gear,levels=c(3,4,5),
             labels=c("3 gears","4 gears","5 gears"))
cyl<-factor(cyl,levels=c(4,6,8),
            labels=c("4 cylinders","6 cylinders","8 cylinders"))

densityplot(~mpg,main="Density Plot",xlab="Miles per Gallon")

densityplot(~mpg|cyl,main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon")

bwplot(cyl~mpg|gear,main="Box Plots by Cylinders and Gears",
       xlab="Miles per Gallon",ylab="Cylinders")

xyplot(mpg~wt|cyl*gear,main="Scatter Plot by Cylinders and Gears",
       xlab="Car Weight",ylab="Miles per Gallon")

cloud(mpg~wt*qsec|cyl,main="3D Scatter Plots by Cylinders")

dotplot(cyl~mpg|gear,
        main="Dot Plots by Number of Gears and Cylinders",
        xlab="Miles Per Gallon")

splom(mtcars[c(1,3,4,5,6)],
      main="Scatter Plot Matrix for mtcars Data")

detach(mtcars)

