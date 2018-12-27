#=======================================================
# some fucking amazing diagrams found on the Internet
#=======================================================

#-------------------------------------------------------
# feather plot
#-------------------------------------------------------
x1 = c(seq(0,pi,length = 50),seq(pi,2*pi,length = 50))
y1 = cos(x1)/sin(x1)
x2 = seq(1.02*2*pi+pi/2,4*pi+pi/2,length = 50)
y2 = tan(x2)

op = par(bg = "black",mar = rep(.5,4))

plot(c(x1,x2),c(y1,y2),type = "n",ylim = c(-11,11))

for (i in seq(-10,10,length = 100))
{
  lines(x1,y1+i,col = hsv(runif(1,.65,.7),1,1,runif(1,.7)), 
        lwd = 4*runif(1,0.3))
  lines(x2,y2+i,col = hsv(runif(1,.65,.7),1,1,runif(1,.7)), 
        lwd = 4*runif(1,0.3))
}
legend("bottomright",legend = "Feather Plot",bty = "n",text.col = "gray70")

#-------------------------------------------------------
# heart plot
#-------------------------------------------------------
theta = seq(-2*pi,2*pi,length = 300)

x = cos(theta)
y = x+sin(theta)

op = par(bg = "black",mar = rep(0.1,4))

plot(x,y,type = "n",xlim = c(-8,8),ylim = c(-1.5, 1.5))

for (i in seq(-2*pi,2*pi,length = 100))
{
  lines(i*x,y,col = hsv(runif(1,0.85,0.95),1,1,runif(1,0.2,0.5)),
        lwd = sample(seq(.5,3,length = 10),1)) 
}
legend("bottomright",legend = "Heart Plot",bty = "n",text.col = "gray70")

#-------------------------------------------------------
# magic circle plot
#-------------------------------------------------------
theta = 1:100

x = sin(theta)
y = cos(theta)

op = par(bg = 'black', mar = rep(0.5, 4))

plot.new()
plot.window(xlim = c(-1, 1), ylim = c(-1, 1), asp = 1)

lines(x, y, col = hsv(0.65, 1, 1))
lines(0.8 * x, 0.8 * y, col = hsv(0.8, 1, 1))
lines(0.6 * x, 0.6 * y, col = hsv(0.9, 1, 1))
lines(0.4 * x, 0.4 * y, col = hsv(0.95, 1, 1))

legend("bottomright", legend = "Magic Circle", bty = "n", text.col = "gray70")

#-------------------------------------------------------
# halo plot
#-------------------------------------------------------
x = seq(-50,50,by = 1)
y = -(x^2)

op = par(bg = 'black',mar = rep(0.5,4))

plot(y,x,type = 'n')

lines(y,x,lwd = 2*runif(1),col = hsv(0.08,1,1,alpha = runif(1,0.5,0.9)))

for (i in seq(10,2500,10))
{
  lines(y-i,x,lwd = 2*runif(1),col = hsv(0.08,1,1,alpha = runif(1,0.5,0.9)))
}

for (i in seq(500,600,10))
{
  lines(y-i,x,lwd = 2*runif(1),col = hsv(0,1,1,alpha = runif(1,0.5,0.9)))
}

for (i in seq(2000,2300,10))
{
  lines(y-i,x,lwd = 2*runif(1),col = hsv(0,1,1,alpha = runif(1,0.5,0.9)))
}

for (i in seq(100,150,10))
{
  lines(y-i,x,lwd = 2*runif(1),col = hsv(0,1,1,alpha = runif(1,0.5,0.9)))
}

legend("bottomright",legend="Halo Plot",bty = "n",text.col="gray70")

#-------------------------------------------------------
# letter plot
#-------------------------------------------------------
nx = 100
ny = 80

x = sample(x = 1:nx,size = 90,replace = TRUE)
y = seq(-1,-ny,length = 90)

op = par(bg = "black",mar = c(0,0.2,0,0.2))

plot(1:nx,seq(-1,-nx),type = "n",xlim = c(1,nx),ylim = c(-ny+10,1))
for (i in seq_along(x))
{
  aux = sample(1:ny,1)
  points(rep(x[i],aux),y[1:aux],pch = sample(letters,aux,replace = TRUE), 
         col = hsv(0.35,1,1,runif(aux,0.3)),cex = runif(aux,0.3))
}
legend("bottomright",legend = "Letter Plot",bty = "n",text.col = "gray70")

#-------------------------------------------------------
# light plot
#-------------------------------------------------------
theta = seq(0,pi,length = 300)

x = cos(theta)
y = sin(theta)

op = par(bg = "black",mar = rep(0.5,4))

plot(x,y,type = 'n')

segments(rep(0,299),rep(0,299),x[1:299]*runif(299,0.7), 
         y[1:299]*runif(299,0.7),
         col = hsv(runif(299,0.45,0.55),1,1,runif(299,0.5)), 
         lwd = 5*runif(299))

legend("topleft", legend = "Light Plot", bty = "n", text.col = "gray70")