### U:2 Lesson 8- Global temperatures


###Load data file im: 
url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'
temp_anomaly = read.delim(url, skip=5, sep="", header=FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))

##create data.frame for data: 
class(temp_anomaly)


head(temp_anomaly)
dim(temp_anomaly)
summary(temp_anomaly)


##Plot data on graph: 

plot(No_Smoothing ~ Year, data=temp_anomaly, type="b") ##b is both points and lines

##Plot the smoothing line on same graph:
plot(No_Smoothing ~ Year, data=temp_anomaly, type="b") 
  lines(Lowess_5 ~ Year, data=temp_anomaly) +
  lines(Lowess_5 ~ Year, data = temp_anomaly, col="blue")
  #create lines to look at specific date ranges: 
    abline(v=2012, lty="dashed")
    abline(v=1998, lty="dashed")
    
##looking for unsmoothed temp value in graphfor year that corresponds to 1998 and 2012: 
    temp_1998 = temp_anomaly$No_Smoothing[which(temp_anomaly$Year == 1998)]
    temp_1998    
    temp_2012 = temp_anomaly$No_Smoothing[which(temp_anomaly$Year == 2012)]
    temp_2012    
  #output results are 1998=0.61 and 2012=0.64 which doesn't seem to different so lets add it to our plot to compare: 
    plot(No_Smoothing ~ Year, data=temp_anomaly, type="b") 
    lines(Lowess_5 ~ Year, data=temp_anomaly) +
      lines(Lowess_5 ~ Year, data = temp_anomaly, col="blue")
    abline(v=2012, lty="dashed")
    abline(v=1998, lty="dashed")
    #create own data frame to add to this graph setup above: 
      lines(y=c(temp_1998, temp_2012), x=c(1998, 2012), col="green", lwd=2)
          ##output shows linear trend line between 1998 and 2012 to clearly see rate of change. 
      
##Calculate rolling averages: 
roll_avg = temp_anomaly
    roll_avg$year5 = NA
    roll_avg$year10 = NA
    head(roll_avg)
  #create for loop
dim(roll_avg)[1]
for(i in seq(dim(roll_avg)[1])){
  # calculate the 5 year rolling averages: 
  if (i >=5){
    roll_avg$year5 = mean(roll_avg$No_Smoothing[c(i-4):i])
  }
  if (i >= 10){
    roll_avg$year10 = mean(roll_avg$No_Smoothing[c((i-9):i)])
  }
}
  
head(roll_avg)
tail(roll_avg)


##plot data as rolling average: 





      
      
            