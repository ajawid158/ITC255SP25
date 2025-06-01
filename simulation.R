#Simulation examples
#x hours per week
#y final  score
# y=a + b*x + e  Final score MODEL

#Step 1: Generate data on x

#Assume that x ~ N(10, 4)

x= rnorm(200, 10, 2)
hist(x, col="blue", xlim=c(0,25))

#Furthermore assume that the error term has a e~N(0,1)

e=rnorm(200, 0,1)

y=20 + 3*x +e

hist(y, col="red")

summary(y)

plot(x,y)

#you want to study a class where some studes work full time, others
#part times, the rest are not working.


#x = ad spending, suppose that x~N(100, 10)
#e~N(0, 1.5)
#y=a+bx+e

x=rnorm(100, 100, 10)
hist(x, col="red", xlim=c(70, 150))
e=rnorm(100, 0, 1.5)

y=200 + 10*x+e

hist(y, col="blue")





