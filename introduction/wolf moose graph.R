#====================================================
# 驼羊密度与狼捕杀率关系图
# R program to plot the average kill rate of moose per wolf 
# (average number of moose killed per wolf per 100 days; 
# vertical axis) with the density of moose (average number
# per 1000 square km; horizontal axis), along with the model
# equation for predation rate from ecological theory.
#
# Data are from Messier, F. 1994. Ungulate population models
# with predation: a case study with the North American moose.
# Ecology 75: 478-488
#====================================================
#--------------------------------------------
# Enter data into two vectors.
#--------------------------------------------
moose.density=c(.17,.23,.23,.26,.37,.42,.66,.80,1.11,1.30,
                1.37,1.41,1.73,2.49)
kill.rate=c(.37,.47,1.90,2.04,1.12,1.74,2.78,1.85,1.88,1.96,
            1.80,2.44,2.81,3.75)
#--------------------------------------------
# Draw a scatterplot of the data.
#--------------------------------------------
plot(moose.density,kill.rate,type="p")
#--------------------------------------------
# Calculate predation rate equation over a range of moose
# densities and store in two vectors, m and k.
#--------------------------------------------
m=2.5*(0:100)/100 # Range of moose densities from 0 to 2.5.
a=3.37            # Prey density at which kill is half of
                  # maximum
b=0.47            # Maximum kill rate
k=a*m/(b+m)       # Model equation calculated for all values
                  # contained in the vector m.
#--------------------------------------------
# Plot the predation rate equation data as a line plot.
#--------------------------------------------
points(m,k,type="l")

