#Lesson 1 Redo: 

##To read in a text file already saved and create table: 

read.table('data/antarctica_mass_200204_202008.txt', skip=31, col.names=c("decimal_date", "mass_Gt"
                                                                          , "sigmas_Gt"))
## To Explore the data: 
#Antarctica ice sheet: 

ant_ice_loss = read.table("data/antarctica_mass_200204_202008.txt", skip=31, sep="", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))

#Greenland ice sheet:

grn_ice_loss = read.table("data/greenland_mass_200204_202008.txt", skip=31, sep="", header = FALSE, col.names = c("decimal_date", "mass_Gt", "sigma_Gt"))
#Data from antarctica and greenland now will appear in the Environment pane to the right. 

##To view this new data from envi pane into a proper spreadsheet: 
#Ex: to view greenland ice sheet loss:

head(ant_ice_loss)
head(grn_ice_loss)
dim(ant_ice_loss)
summary(ant_ice_loss)
#output of code will be a summary of stats from the data table. 

##How to plot: 
#Individual plots
plot(mass_Gt ~ decimal_date, data=ant_ice_loss, ylab="Antarctica Mass Loss (Gt)")
plot(mass_Gt ~ decimal_date, data=grn_ice_loss, ylab="Greenland Mass Loss (Gt)")
#plot both graphs together as one: 
plot(mass_Gt ~ decimal_date, data=ant_ice_loss, ylab="Ice Sheet Mass Loss (Gt)", type='l') + lines(mass_Gt ~ decimal_date, data=grn_ice_loss, col='red')
#resulting graph should be one graph with 2 lines, one black and one red to distinguish between the locations. 


##To readjust bounds of a graph to better fit in the window: manually set y-axis. 
plot(mass_Gt ~ decimal_date, data=ant_ice_loss, ylab="Antarctica Mass Loss (Gt)", type='l', ylim=range(grn_ice_loss$mass_Gt)) +
  lines(mass_Gt ~ decimal_date, data=grn_ice_loss, type='l', col='red') 


##To breakup data sets in a graph by inserting an NA into the data frame where we didnt collect data. 
#Ex: Create a dataframe with an NA between the GRACE missions. Make sure to match up column names. 
data_break = data.frame(decimal_date=2018.0, mass_Gt=NA, sigma_Gt=NA)
data_break
#Next: add NA data to Antarctica ice trends data frame
ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break)
tail(ant_ice_loss_with_NA)
ant_ice_loss_with_NA = ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date),]
#The code will merge the ice loss data the, organized to last row, then reordered by date. 
#repeat with greenland:
grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break)
grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date),]

plot(mass_Gt ~ decimal_date, data=ant_ice_loss_with_NA, ylab="Antarctica Mass Loss (Gt)", type='l', ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE)) +
  lines(mass_Gt ~ decimal_date, data=grn_ice_loss_with_NA, type='l', col='red') 

##Add a 95% confidence interval which is your standard deviation. 
head(ant_ice_loss_with_NA)
plot(mass_Gt ~ decimal_date, data=ant_ice_loss_with_NA, ylab="Antarctica Mass Loss (Gt)", xlab="Year", type='l') + 
  lines((mass_Gt+2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, type='l', lty='dashed') + 
  lines((mass_Gt-2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, type='l', lty='dashed')
#Do the same for greenland: Exercise 1.1: 
plot(mass_Gt ~ decimal_date, data=grn_ice_loss_with_NA, ylab="Greenland Mass Loss (Gt)", xlab="Year", type='l') + 
  lines((mass_Gt+2*sigma_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, type='l', lty='dashed') + 
  lines((mass_Gt-2*sigma_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, type='l', lty='dashed')


##How to save these 2 above plots as a combined figure onto our computer: 

pdf('figures/ice_mass_trends.pdf', width=7, height=5)
plot(mass_Gt ~ decimal_date, data=ant_ice_loss_with_NA, ylab="Antarctica Mass Loss (Gt)", xlab="Year", type='l', ylim=range(grn_ice_loss_with_NA$mass_Gt, na.rm=TRUE), lwd=2) +
  lines((mass_Gt+2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, type='l', lty='dashed') +
  lines((mass_Gt-2*sigma_Gt) ~ decimal_date, data=ant_ice_loss_with_NA, type='l', lty='dashed') +
  lines(mass_Gt ~ decimal_date, data=grn_ice_loss_with_NA, type='l', col='red', lwd=2) +
  lines((mass_Gt+2*sigma_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, type='l', lty='dashed', col="red") +
  lines((mass_Gt-2*sigma_Gt) ~ decimal_date, data=grn_ice_loss_with_NA, type='l', lty='dashed', col="red") 
dev.off()


##Bar plots showing differnt summary of stats: 
#largest observed decrease in ice mass loss of antarctica:
min(ant_ice_loss$mass_Gt)
#barplot of largest observed ice loss of both places: 
barplot(height=c(min(ant_ice_loss$mass_Gt), min(grn_ice_loss$mass_Gt)))
#flip negative to positive, add axis labels and tix marks: 
barplot(height=c(min(ant_ice_loss$mass_Gt)*(-1), min(grn_ice_loss$mass_Gt)*(-1)), names.arg=c("Antarctica","Greenland"), ylim=c(0,5000), ylab="Ice loss in Gt")



