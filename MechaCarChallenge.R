library(dplyr)
library(tidyverse)

#import MechaCar data
mechaCharData <- read_csv("Resources/MechaCar_mpg.csv")
#display first rows of the imported data
head(mechaCharData)

#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCharData)

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCharData))
