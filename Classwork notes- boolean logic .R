## Unit 2 lesson 2- Boolean logic

world_oceans = data.frame(ocean =c("Atlantic", "Pacific", "Indian", "Arctic", "Southern"), area_km2 = c(77e6, 156e6, 69e6, 14e6, 20e6), avg_depth_m =c(3926, 4028, 3963, 3953, 4500))


##Look at oceans that have depth greater than 4km: 
head(world_oceans)
world_oceans$avg_depth_m > 4000
#can sort depending on which one meets that condition:
world_oceans[ world_oceans$avg_depth_m > 4000, ]
#can take condition and sum it:
sum( world_oceans$avg_depth_m > 4000 )
### logical langugage: 1=true 0=false

world_oceans$ocean[ world_oceans$avg_depth_m > 4000 ]

##command head: returns first 6 rows of data. $ command points to specific name in column or number interested column. 


##Exercise 2.1: 
visit <- world_oceans[c(1,2,3),]
visit$area_km2<77e6
visit$area_km2 %in% world_oceans$area_km2
##OR (2.1)
my_ocean_visit =c("Atlantic", "Pacific", "Indian")
my_oceans = world_oceans[ world_oceans$ocean %in% my_ocean_visit, ]
my_oceans
#output oceans i visited. 


####STOPPED AT 34:16 

##Boolean logic operators:
# "And" (&)
# "Or" (|), can flip the conditions
# any (any(cond1, cond2)), are any of these conditions true?
# all (all(cond1,cond2,,,)) are all of the conditions true? 

##Logical conditions:
x = 10
y = 5
z = 2
x,y$y,z
#output should be error because it is false
#change and to or
x<y|y>z
a =c(TRUE, FALSE, TRUE)
any(a)
all(a)
#N/A does not work in logcial conditions but, if you use:"is.na(data)" will work
is.na(NA)
data = c(1,2,3,NA,4)
is.na(data)
#to check if there is any NA in my data:
all( is.na(data) )







####LESSON 3- IF ELSE STATEMENTS

##If/else statements: 
num = -2
#condition needs to go in squigly brackets
if(num < 0){ num = num* -1}
num
#another example of if/else: if the condition inside the squigly is false, it will not even print out
num = 8 
if(num < 0){print("your number is negative") num = num* -1}


##What to do if you don't meet your condition: if else if chaings allow second condition to be evaluated as long as first 
##condition is false. 
num

score_1 = 35
score_2 = 41
if(score_1 > score_2){print("1 wins!")} else if (score_2 > score_1){print("2 wins!")} else (print"they tied")
#re-do
a = 35
b = 41
if (a > b) {
  print("A wins!")
} else if (a < b) {
  print("B wins!")
} else {
  print("Tie.")
}

##test integers, same as if else chain. 
a = 0
ifelse(a > 0, 1/a, NA)
# ifelse statements: ifelse(condition, if true do this, if false do that)
x = 2