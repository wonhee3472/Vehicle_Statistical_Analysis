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
