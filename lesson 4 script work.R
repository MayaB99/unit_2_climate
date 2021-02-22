### Lesson 4- Mauan loa


url = 'ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt'
co2 = read.table("data/co2_mm_mlo.txt", col.names = c("year", "month", "decimal_date", "monthly_average", "deseasonalized", 
                                                      "n_days", "st_dev_days", "monthly_mean_uncertainty"))
##use read.table function to read in data like above. 

head(co2)
class(co2)
#summary of data: gives ranges and b asic stats of data 
summary(co2)
#look at stats of specific variable:
range(co2$decimal_date)
range(co2$monthly_average)


###############################
#       PLOT-     
###############################


plot(monthly_average ~ decimal_date, data=co2, type="l")
#add to exisitng plot: 
lines(y=co2$deseasonalized, x=co2$decimal_date, col= "blue")

#create a new variable:
co2$seasonal_cycle = co2$monthly_average - co2$deseasonalized
head(co2)
#plot the graph: 
plot(seasonal_cycle ~ decimal_date, data=co2, type="l")
#to view a section of the plot only:
plot(seasonal_cycle ~ decimal_date, data=co2[co2$decimal_date > 2015, ], type="l")



###########################
#       seasonal cycle analysis
###########################

#look at data for 1 month with which statement
jan_anomolies = co2$seasonal_cycle[which(co2$month==1)]
mean(jan_anomolies)
#how to save data of means of seasonal cycles: create new data frame

co2_monthly_cycle = data.frame(month=seq(1,12), detrended_monthly_cycle = NA)
(co2$seasonal_cycle[which(co2$month==1)] )
co2_monthly_cycle$detrended_monthly_cycle[1] = mean( co2$seasonal_cycle[which(co2$month==1)] )
co2_monthly_cycle
#do for each month: 
co2_monthly_cycle$detrended_monthly_cycle[1] = mean( co2$seasonal_cycle[which(co2$month==1)] )
co2_monthly_cycle$detrended_monthly_cycle[2] = mean( co2$seasonal_cycle[which(co2$month==2)] )
co2_monthly_cycle$detrended_monthly_cycle[3] = mean( co2$seasonal_cycle[which(co2$month==3)] )
co2_monthly_cycle$detrended_monthly_cycle[4] = mean( co2$seasonal_cycle[which(co2$month==4)] )
co2_monthly_cycle$detrended_monthly_cycle[5] = mean( co2$seasonal_cycle[which(co2$month==5)] )
co2_monthly_cycle$detrended_monthly_cycle[6] = mean( co2$seasonal_cycle[which(co2$month==6)] )
co2_monthly_cycle$detrended_monthly_cycle[7] = mean( co2$seasonal_cycle[which(co2$month==7)] )
co2_monthly_cycle$detrended_monthly_cycle[8] = mean( co2$seasonal_cycle[which(co2$month==8)] )
co2_monthly_cycle$detrended_monthly_cycle[9] = mean( co2$seasonal_cycle[which(co2$month==9)] )
co2_monthly_cycle$detrended_monthly_cycle[10] = mean( co2$seasonal_cycle[which(co2$month==10)] )
co2_monthly_cycle$detrended_monthly_cycle[11] = mean( co2$seasonal_cycle[which(co2$month==11)] )
co2_monthly_cycle$detrended_monthly_cycle[12] = mean( co2$seasonal_cycle[which(co2$month==12)] )
co2_monthly_cycle
co2_monthly_cycle
#plot this data on a graph: 
plot(detrended_monthly_cycle ~ month, data=co2_monthly_cycle, type="l")

##Exercise 4.1

#plot seasonal cycle for 1959: 
plot(seasonal_cycle ~ month, data=co2_monthly_cycle[co2$monthly_average > 1959, ], type="l")
plot(seasonal_cycle ~month, co2[co2$year == 1959,], type = "l", col = "red", ylim = c(-4,4))
lines(seasonal_cycle ~ month, co2[co2$year == 2020,], col = "green")
