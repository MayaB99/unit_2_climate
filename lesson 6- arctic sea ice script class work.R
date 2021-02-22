####SEA ICE DATA ########

## First- must load in data, can do by copying url in then read it in using read.delim: 
url = 'ftp://sidads.colorado.edu/DATASETS/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v3.0.csv'
arctic_ice = read.delim(url, skip=2, sep=",", header=FALSE, col.names = c("Year", "Month", "Day",
                    "Extent", "Missing", "Source_Data"))
head(arctic_ice)
summary(arctic_ice)
##note that we are not working with decimals so it wont put everything in order. 
install.packages("lubridate")

arctic_ice$date = make_date(year = arctic_ice$Year, month=arctic_ice$Month, day=arctic_ice$Day)
class(arctic_ice$date)
#plot graph: 
plot(Extent~date, data=arctic_ice, type="l")

#to delete the annual cycle to see the trend over time: calculate averages using a for loop

#annual average:
summary(arctic_ice)
arctic_ice_annual = data.frame(Year=c(1978:2021), extent_annual_avg = NA, extent_5yr_avg = NA)
arctic_ice_annual

dim(arctic_ice_annual)[1]
for(i in seq(dim(arctic_ice_annual)[1])){
  arctic_ice_annual$extent_annual_avg[1] = mean(arctic_ice$Extent[which(arctic_ice$Year == 1978)])
}


## 5 year rolling average: 
for (i in seq(dim(arctic_ice_annual)[-1]-1)){
  years = seq(arctic_ice_annual$Year[i]-2, arctic_ice_annual$Year[i]+2)
  arctic_ice_annual$extent_annual_avg[i] = mean(arctic_ice$Extent[which(arctic_ice$Year == arctic_ice_annual$Year[i])])
}

     
     