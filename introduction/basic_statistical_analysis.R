#===========================================
# 基本统计方法
#===========================================
#-------------------------------------------
# 描述性统计
#-------------------------------------------
vars <- c("mpg","hp","wt")
head(mtcars[vars])

summary(mtcars[vars])

mystats <- function(x,na.omit = FALSE){
  if(na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x) # 标准差
  skew <- sum((x-m)^3/s^3)/n # 偏度
  kurt <- sum((x-m)^4/s^4)/n - 3 # 峰度
  return(c(n = n,mean = m,stdev = s,skew = skew,kurtosis = kurt))
} # 自定义函数计算描述性统计量

sapply(mtcars[vars],mystats)

#-------------------------------------------
# 各种扩展包描述性统计方法
#-------------------------------------------
library(Hmisc)
describe(mtcars[vars])

#---------------------------
# stat.desc(x,basic = TRUE,desc = TRUE,norm = FALSE,p = 0.95)
# basic: 所有值、空值、缺失值数量、最小最大值、值域、总和
# desc: 中位数、平均数、标准误、置信区间、方差标准差、变异系数
# norm: 偏度、峰度、shapiro-wilk正态检验结果
#---------------------------
library(pastecs)
stat.desc(mtcars[vars])

library(psych)
describe(mtcars[vars])

#-------------------------------------------
# 分组计算描述性统计量
#-------------------------------------------
aggregate(mtcars[vars],by = list(am = mtcars$am),mean)
aggregate(mtcars[vars],by = list(am = mtcars$am),sd)

library(doBy)
summaryBy(mpg+hp+wt~am,data = mtcars,FUN = mystats)

library(psych)
describeBy(mtcars[vars],mtcars$am)

library(reshape)
dstats <- function(x) (c(n = length(x),mean = mean(x),sd = sd(x)))
dfm <- melt(mtcars,measure.vars = c("mpg","hp","wt"),id.vars = c("am","cyl"))
cast(dfm,am+cyl~variable,dstats)

library(vcd)
head(Arthritis)

mytable <- with(Arthritis,table(Improved))
mytable

prop.table(mytable)

library(gmodels)
CrossTable(Arthritis$Treatment,Arthritis$Improved)

#-------------------------------------------
# 独立性检验
#-------------------------------------------
library(vcd)
mytable <- xtabs(~Treatment+Improved,data = Arthritis)
chisq.test(mytable) # 治疗情况与改善情况不独立

mytable <- xtabs(~Sex+Improved,data = Arthritis)
chisq.test(mytable) # 性别与改善情况独立（警告信息是由于有一个观测值仅为2）

mytable <- xtabs(~Treatment+Improved,data = Arthritis)
fisher.test(mytable)

mytable <- xtabs(~Treatment+Improved+Sex,data = Arthritis)
mantelhaen.test(mytable)