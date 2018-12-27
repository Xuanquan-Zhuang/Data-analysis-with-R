#=============================================================
# loan payment. R: R script to calculate and plot monthly loan
# payment information.
#=============================================================

#-------------------------------------------------------------
# step 0. assign numerical values to P (principal), m (total 
# number of monthly payments), and i (annual interest rate).
# calculate s (monthly interest rate).
#-------------------------------------------------------------
P=25000
m=360
i=.05
s=i/12

#-------------------------------------------------------------
# step 1. calculate a vector of values of time (months) going
# from 1 to m
#-------------------------------------------------------------
t=1:m

#-------------------------------------------------------------
# step 2. calculate the monthly payment (a single number)
# using the first loan equation.
#-------------------------------------------------------------
monthly.payment=(1+s)^m*s*P/((1+s)^m-1)

#-------------------------------------------------------------
# step 3. calculate a vector of principal amounts paid each
# month of the loan using the second loan equation.
#-------------------------------------------------------------
principal.paid.month.t=(1+s)^(t-1)*s*P/((1+s)^m-1)

#-------------------------------------------------------------
# step 4. calculate a vector of principal amounts remaining
# unpaid each month of the loan using the third load equation.
#-------------------------------------------------------------
principal.remaining=P*(1-((1+s)^t-1)/((1+s)^m-1))

#-------------------------------------------------------------
# step 5. calculate a vector of the interest amounts paid
# each month by substracting the principal amounts paid from the
# monthly payment.
#-------------------------------------------------------------
interest.paid.month.t=monthly.payment-principal.paid.month.t

#-------------------------------------------------------------
# step 6. calculate the total interest paid by summing all the
# interest amounts paid each month using the sum() function in R.
#--------------------------------------------------------------
total.interest.paid=sum(interest.paid.month.t)

#-------------------------------------------------------------
# step 7. print the results to the console.
#-------------------------------------------------------------
monthly.payment
total.interest.paid
t
principal.paid.month.t
interest.paid.month.t
principal.remaining


#-------------------------------------------------------------
# step 8. draw a graph of the principal remaining in the loan
# each month (vertical axis) versus the vector of months
# (horizontal axis).
#-------------------------------------------------------------
plot(t,principal.remaining,type="l")