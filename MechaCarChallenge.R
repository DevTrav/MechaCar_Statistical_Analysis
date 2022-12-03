# load package
library(dplyr)
# import and read csv as a dataframe
MechaCar_mpg <- read.csv(file='Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(MechaCar_mpg)
# linear regression model
model = lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=MechaCar_mpg)
# summary statistics
summary(model)

# import csv and read as a table
Suspension_Coil <- read.csv(file='Resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
#stat summary with summarize()
total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
# stat summary wtih group_by()
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI) , .groups = 'keep') 

# T-tests
All_Lots_t <- t.test(Suspension_Coil$PSI, mu=1500)

# Individual lot t-tests
Lot1 <- Suspension_Coil %>% subset(Manufacturing_Lot == "Lot1")
Lot2 <- Suspension_Coil %>% subset(Manufacturing_Lot == "Lot2")
Lot3 <- Suspension_Coil %>% subset(Manufacturing_Lot == "Lot3")

t1 <- t.test(Lot1$PSI, mu=1500)
t2 <- t.test(Lot2$PSI, mu=1500)
t3 <- t.test(Lot3$PSI, mu=1500)

summary(t2)
summary(t3)
