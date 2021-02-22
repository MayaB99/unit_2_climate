### Feb. 10, 2021####
###       FOR LOOPS REFRESHER

#creat a vector:
vec =c(1,3,5,7,9)
#creat a loop to add all numbers in vector from line 5. Need a results variable to name it first before you start loop.
#results variable;
total = 0

for(i in seq(length(vec))){
  total = total + vec[i] 
  print(total)
  }
  #squigly brackets in code line 10 is the code iterated over during the loop. 
  #add numebres to reutls variabel total, do by setting total equal to itself: 
  
total
###common functions in are are vectorized meaning R knows how to handle it. 
sum(vec)
## line 18 summation of all variables in vec. 
vec^2
#loop- allows the repeat of analysis on a set of data. 


###Exercise 5.1: Use a for() loop to calculate the factorial (symbol !) of any integer number greater than 0.
##(For example: 3! = 3*2*1 = 6) Test it with `num = 3` and `num = 6`.

n= c(3)
for (i in seq(length(n))){
  f= factorial(n)
  print(f)
}
##and: for n=5:
n= 5
for (i in seq(length(n))){
  f= factorial(n)
  print(f)}



####### NESTED FOR LOOPS ###########

#Nested for loops- great for going through a matrix or data frame instead of a vector.

##Nested Loops: 
#creat a matrix first:
mat = matrix(c(2,0,8,3,5,-4), nrow=2, ncol=3)
print(mat)
results = matrix(data=NA, nrow=2, ncol=3)
print(results)
##perform a task in every matrix woud need to step throug every row and column:
#create empty matix with data equals na in like 49. 
#To make the nestd loop to step through each row and column: we want to square 2, and 8. 
for (i in c(1:2)){
  for(j in c(1:3)){
    results[i,j] = mat[i,j]^2
    print(paste("row: ",i," and column: ",j))
    print(results)
    }}
results


######### WHILE LOOPS######
###while loops- operates on a condition, i want you to keep operating my loop till condition is met.

num = -3
while(num<0){
  num=num+1
  print(num)}
}
##Infinite loops:
init_num = -3
num = init_num
while(num < 0){
  num = num+1
  print(num)
}
init_num
num




