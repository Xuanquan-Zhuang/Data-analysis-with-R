#==============================================================
# OLS回归
# 为了能够恰当地解释OLS模型的系数，数据必须满足一下统计假设。
# 正态性：对于固定的自变量值，因变量值成正态分布
# 独立性：因变量观测值之间相互独立
# 线性：因变量与自变量之间为线性相关
# 同方差性：因变量的方差不随自变量的水平不同而变化
#==============================================================
#--------------------------------------------------------------
# 使用lm()拟合模型
#--------------------------------------------------------------
# 使用women数据集
head(women)

fit<-lm(weight~height,data=women)
summary(fit)

women$weight # 实际身高
fitted(fit) # 拟合模型的预测值
residuals(fit) # 残差

plot(women$height,women$weight,xlab="Height (in inches)",
     ylab="Weight (in pounds)")
abline(fit)

fit2<-lm(weight~height+I(height^2),data=women)
summary(fit2)

plot(women$height,women$weight,xlab="Height (in inches)",
     ylab="Weight (in pounds)")
lines(women$height,fitted(fit2))

library(car)
scatterplot(weight~height,data=women,spread=FALSE,
            lty=2,pch=19,
            main="Women Age 30-39",
            xlab="Height (inches)",
            ylab="Weight (lbs.)")
# 线性拟合与平滑拟合

#--------------------------------------------------------------
# 多元线性回归
# 以基础包中的state.x77数据集为例
#--------------------------------------------------------------
states<-as.data.frame(state.x77[,c("Murder","Population",
                                   "Illiteracy","Income","Frost")])
# 建立数据框

# 多元回归分析中第一步最好检查一下变量间的相关性。cor()函数提供
# 二变量之间的相关系数，car包中scatterplotMatrix()函数则会产生
# 散点图矩阵
cor(states)
library(car)
scatterplotMatrix(states,spread=FALSE,lty=2,
                  main="Scatter Plot Matrix")

fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
summary(fit)

#--------------------------------------------------------------
# 回归诊断
#--------------------------------------------------------------
states<-as.data.frame(state.x77[,c("Murder","Population",
                                   "Illiteracy","Income","Frost")])
fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
confint(fit)

fit<-lm(weight~height,data=women)
setting<-par(mfrow=c(2,2))
plot(fit)
par(setting)

fit2<-lm(weight~height+I(height^2),data=women)
setting<-par(mfrow=c(2,2))
plot(fit2)
par(setting)

# 一些改进方法
library(car)
states<-as.data.frame(state.x77[,c("Murder","Population",
                                   "Illiteracy","Income","Frost")])
fit<-lm(Murder~Population+Illiteracy+Income+Frost,data=states)
qqPlot(fit,labels=row.names(states),id.method="identify",
       simulate=TRUE,main="Q-Q Plot")
