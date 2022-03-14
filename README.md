# Vehicle_Statistical_Analysis

## Project Overview
* Use statistics and hypothesis testing to analyze a series of dataset from an automotive company, AutosRUs.
* Statistical analysis and visualization for this project was all done in the R programming language.

## Resources
* Data Source: [MechaCar_mpg.csv](Resources/MechaCar_mpg.csv), [Suspension_Coil.csv](Resources/Suspension_Coil.csv)
* The `MechaCar_mpg.csv` dataset contains mpg test results for 50 prototype MechaCars. The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance, were collected for each vehicle

## Linear Regression to Predict MPG

### Analysis 
* `MechaCar_mpg.csv` was imported and read into a dataframe
    > mechaCharData <- read_csv("Resources/MechaCar_mpg.csv")
* An R code for a linear regression model
    > lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCharData)
* An R code for the statistical summary of the linear regression model with the intended p-values
    > summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCharData))

### Result
![](Resources/summary_statistics.png)

* In the output, each number in the `Pr(>|t|)` column represents how statistically likely each variable provides a non-random amount of variance to the mpg values in the dataset. According to the summary, the **vehicle length** and **vehicle ground clearance** have a significant impact on miles per gallon on the MechaCar prototype. On the other hand, the **vehicle weight**, **spoiler angle**, and **All Wheel Drive (AWD)** have p-values that indicate a random amount of variance with the dataset.

* The p-value for this model is `5.35e-11` and it is much smaller than the assumed significance level of `0.05%`. That is, there is enough evidence to **reject the null hypothesis**, which can be understood that the slope of this linear model is **not zero**.

* The R-sqaured value is 0.7149 and it means that about 71-72% of all mpg predictions could be determined by this model. This is a  relatively high percentage so it can be deduced that this multiple regression model `does predict mpg of MechaCar prototypes quite effectively`.


