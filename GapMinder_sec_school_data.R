#
# goood repo for graph making https://monashbioinformaticsplatform.github.io/r-intro/ggplot.html

setwd("C:/users/daniel.scott/downloads")

# good link for how to tidy data https://s3.amazonaws.com/udacity-hosted-downloads/ud651/DataWranglingWithR.pdf
#data from https://www.gapminder.org/data/

sec_school <- read.csv("expenditure_per_student_secondary_percent_of_gdp_per_person.csv")

head(sec_school)

library(tidyr)

#clean data to be reorangised into country, year, and % of gdp expenditure
sec_school_tidy <- gather(sec_school, year, edu_pct_gdp, -geo)

library(ggplot2)
qplot(sec_school2)

uk <- subset(sec_school_tidy, geo =="United Kingdom")
qplot(x = year, y = edu_pct_gdp, data = uk)

chile <- subset(sec_school_tidy, geo == "Chile")

usa <- subset(sec_school_tidy, geo == "United States")


ggplot(data = sec_school_tidy, aes(value, fill = geo)) + geom_histogram()
ggplot(data = sec_school_tidy, aes(value, fill = geo)) + geom_freqpoly()

#read money spent on health
health_spending <- read.csv("out_of_pocket_share_of_total_health_spending_percent.csv")
#clean it
health_spending_tidy <- gather(health_spending, year, health_pct_gdp, -geo)

#merge two datasets
edu_health<- merge(sec_school2, health_spending_tidy)

#check  % of missing data


# plotting for edu_pct_gdp
ggplot(data = edu_health, aes(x = year, y= edu_pct_gdp, group =geo), stat = "identity") + geom_line() + facet_wrap(~geo, ncol = 10)

ggplot(data = edu_health, aes(x = year, y= health_pct_gdp, group =geo), stat = "identity") + geom_line() + facet_wrap(~geo, ncol = 10)
