#import library
library(dplyr) 

#import MechaCar_mpg data
mcar_data <- read.csv(file = "MechaCar_mpg.csv", check.names = F, stringsAsFactors = F)

#perform linear regression
linreg_mpg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mcar_data)

#get summary data
summary(linreg_mpg)


#import Suspension_Coil data
coil_data <- read.csv(file = "Suspension_Coil.csv",check.names = F, stringsAsFactors = F)

#create summary for statistical data of all suspension coil 
total_summary <- coil_data %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create summary table

#create summary for statistical data of suspension coils by lot
lot_summary <- coil_data %>%group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') #create summary table

#create t-test for total 
total_t <- t.test(coil_data$PSI, mu=1500)

#create t-test for each lot

lot1_t <- t.test(subset(coil_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)
lot2_t <- t.test(subset(coil_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)
lot3_t <- t.test(subset(coil_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)



