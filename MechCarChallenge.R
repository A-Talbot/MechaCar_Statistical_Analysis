# Import Library
library(dplyr)

# Read Data (as DF)
MechaCar_mpg_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

# Create Multi Layer Regression
multi_lm_model <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=MechaCar_mpg_df)

# Summary STATS
summary(multi_lm_model)

# Read Data (as TABLE)
suspension_coil_tb <- read.csv(file='Suspension_coil.csv',check.names=F,stringsAsFactors=F)

# Summary STATS
total_summary <- suspension_coil_tb %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
total_summary

# Summary STATS (grouped by manufacturing lot)
lot_summary <- suspension_coil_tb %>% group_by(Manufacturing_Lot, .add = F) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
lot_summary

### Use student's t-test to analyze variance in lot means
t.test(suspension_coil_tb$PSI,mu=1500)

### Use student's t-test to analyze variance lot means (against standard 1500 PSI)
t.test(subset(suspension_coil_tb,Manufacturing_Lot=='Lot1')[3],mu=1500)
t.test(subset(suspension_coil_tb,Manufacturing_Lot=='Lot2')[3],mu=1500)
t.test(subset(suspension_coil_tb,Manufacturing_Lot=='Lot3')[3],mu=1500)
