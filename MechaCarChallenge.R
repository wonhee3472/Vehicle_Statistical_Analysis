library(dplyr)
library(tidyverse)

#import MechaCar data
mechaCharData <- read_csv("Resources/MechaCar_mpg.csv",check.names=F,stringsAsFactors = F)
#display first rows of the imported data
head(mechaCharData)

#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCharData)

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCharData))


#import Suspension data
suspensionData <- read.csv(file="Resources/Suspension_Coil.csv",check.names=F,stringsAsFactors = F)
#display first rows of the imported data
head(suspensionData)

#create a total_summary dataframe
total_summary <- suspensionData %>% summarize(Mean_PSI=mean(PSI),
                                              Median_PSI=median(PSI),
                                              Var_PSI=var(PSI),
                                              Std_Dev_PSI=sd(PSI),
                                              .groups='keep')
show(total_summary)

#create a lot_summary dataframe
lot_summary <- suspensionData %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                            Median_PSI=median(PSI),
                                                                            Var_PSI=var(PSI),
                                                                            Std_Dev_PSI=sd(PSI),
                                                                            .groups='keep')
show(lot_summary)

#box plot for each lot's PSI
plt <- ggplot(suspensionData, aes(x=Manufacturing_Lot, y=PSI))
plt + geom_boxplot()


#perform t.test() to determine if the PSI across ALL lots is statistically different from the population mean of 1,500 PSI
t.test(suspensionData$PSI, mu=1500)

#Use t.test() function 3 more times with subset() to determine if PSI for each manufacturing lot is statistically different from the pop. mean of 1,500 PSI
lot1 <- subset(suspensionData, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspensionData, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspensionData, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)
