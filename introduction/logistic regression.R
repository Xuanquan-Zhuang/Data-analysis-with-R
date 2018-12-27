#===========================================================
# Logistic Regression
#===========================================================
library(AER)
data(Affairs,package="AER")
summary(Affairs)
table(Affairs$affairs)

Affairs$ynaffair[Affairs$affairs>0]<-1
Affairs$ynaffair[Affairs$affairs==0]<-0
Affairs$ynaffair<-factor(Affairs$ynaffair,levels=c(0,1),
                         labels=c("No","Yes"))
table(Affairs$ynaffair)

fit.full<-glm(ynaffair~gender+age+yearsmarried+children+
                religiousness+education+occupation+rating,
              data=Affairs,family=binomial())
summary(fit.full)

fit.reduced<-glm(ynaffair~age+yearsmarried+religiousness+rating,
              data=Affairs,family=binomial())
summary(fit.reduced)

anova(fit.reduced,fit.full,test="Chisq")
# It's not a significant result. So we shall consider fit.reduced
# can fit the data as well as fit.full.

coef(fit.reduced)
exp(coef(fit.reduced))
exp(confint(fit.reduced))

testdata<-data.frame(rating=1:5,age=mean(Affairs$age),
                     yearsmarried=mean(Affairs$yearsmarried),
                     religiousness=mean(Affairs$religiousness))
testdata

testdata$prob<-predict(fit.reduced,newdata=testdata,type="response")
testdata

testdata<-data.frame(rating=mean(Affairs$rating),age=seq(17,57,10),
                     yearsmarried=mean(Affairs$yearsmarried),
                     religiousness=mean(Affairs$religiousness))
testdata$prob<-predict(fit.reduced,newdata=testdata,type="response")
testdata