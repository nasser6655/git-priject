
ny <- read.csv('new_york_city.csv')
wash <- read.csv('washington.csv')
chi <-  read.csv('chicago.csv')
us <- rbind(ny,chi)
library(readr)
library(tidyr)
library(plyr)
library(ggplot2)
library(dplyr)
library(lubridate)
library(tidyverse)




head(ny)

head(wash)

head(chi)

###### We are looking for missing values

colSums(is.na(ny))
colSums(is.na(wash))
colSums(is.na(chi))
colSums(is.na(us))

ny1 <- drop_na(ny)
wash1 <- drop_na(wash)
chi1 <- drop_na(chi)
us1 <- drop_na(us)

colSums(is.na(ny1))
colSums(is.na(wash1))
colSums(is.na(chi1))
colSums(is.na(us1))

summary(us1$Trip.Duration[ny1$Gender=="Male"])


summary(us1$Trip.Duration[ny1$Gender=="Female"])

qplot(x = Gender  , y = Trip.Duration , data = subset(us1,!is.na(Gender)), geom = 'boxplot',
      main = "Average miles traveled by gender" , xlab = "Gender" , ylab = " Miles") + coord_cartesian(ylim = c(0,1500))


ny1["old"] <- 2017-ny1$Birth.Year
chi1["old"] <- 2017-chi1$Birth.Year
us1["old"] <- 2017-us1$Birth.Year

ggplot(data= us1, aes(x=us1$Trip.Duration, y=us1$old)) + geom_point(aes())  + coord_cartesian(xlim = c(0,10000), ylim = c(15,100)) 

us1<- drop_na(us)
us1 <- rbind(ny1,chi1)
str(us1)

us1["old"] <- 2017-us1$Birth.Year
us1["old.group"] <- cut(us1$old,c(15,25,35,45,55,100),c("15-24","25-34","35-44","45-54","more than 55"))

str(us1)

head(us1)

summary(us1$old.group)

qplot( x = old.group, data = us1 , gemo = "line", main = " The average age of bike rentals in washenton and New York City", xlab = "old group" , ylab = "frequense")

system('python -m nbconvert Explore_bikeshare_data.ipynb')
