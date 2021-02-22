### U:2 Lesson 8- Global temperatures


###Load data file im: 
url = 'https://data.giss.nasa.gov/gistemp/graphs/graph_data/Global_Mean_Estimates_based_on_Land_and_Ocean_Data/graph.txt'
temp_anomaly = read.delim(url, skip=5, sep="", header=FALSE, col.names = c("Year", "No_Smoothing", "Lowess_5"))

temp_anomaly$No_Smoothing

head(temp_anomaly)
summary(temp_anomaly)


##Plot data on graph: 

plot(No_Smoothing ~ Year, data=temp_anomaly, type="b") ##b is both points and lines

##Plot the smoothing line on same graph:
lines(Lowes)
