## In class less 1: Ice Sheets


ant_ice_loss = read.table('data/antarctica_mass_200204_202008.txt', skip=31, col.names=c("decimal_date", "mass_Gt", "sigmas_Gt"))
grn_ice_loss = read.table('data/antarctica_mass_200204_202008.txt', skip=31, col.names=c("decimal_date", "mass_Gt", "sigmas_Gt"))


summary(ant_ice_loss)
dim(grn_ice_loss)
#how to plot data graphs: 

#need data frame first: 
range(grn_ice_loss$mass_Gt)

plot(mass_Gt ~ decimal_date, data = ant_ice_loss, main="Antarctic ice loss", ylab = "Mass loss(Gt)", ylim=range(grn_ice_loss$mass_Gt), type="l")
lines(mass_Gt ~ decimal_date, data = grn_ice_loss, ylab = "Mass loss (Gt)", col="red")

lines(mass_Gt ~ decimal_date, data = grn_ice_loss, main="Greenland ice loss",ylab = "Mass loss(Gt)")

#insert break in data frame of 2017-2018

tail(ant_ice_loss)
data.frame(decimal_date = 2018, mass_Gt=NA, sigma_Gt=NA)
data_break

#combinging rows:
ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break)
tail(ant_ice_loss_with_NA)

#sort new data set with iceloss w na: 


#how to save the plots: 
pdf('figures/ice_mass_trend.pdf', width=7, height=5)

#plot with uncertainty: 
plot(mass_Gt ~ decimal_date, data = ant_ice_loss_with_NA, ylab = "Mass loss (Gt)", ylim range(grn_ice_loss$mass_Gt), type="l")

### after you have coded for a plot to finish saving you must close by adding the code: dev.off(). 

##how to make bar plots
#lets look at total loss in ice sheets overtime! 
min(ant_ice_loss$mass_Gt)
min(grn_ice_loss$mass_Gt)

barplot(height=c(min(ant_ice_loss$mass_Gt), min(grn_ice_loss$mass_Gt)), names.org=c("Antarctica", "Greenland"))
barplot(height=c(-1*min(ant_ice_loss$mass_Gt), -1*min(grn_ice_loss$mass_Gt)), names.org=c("Antarctica", "Greenland"), ylim=c(0,5000))
warnings()



