# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
# Install (if you haven't already) and load the `dplyr`package
install.packages('dplyr')
library(dplyr)
# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
veh.year<-filter(vehicles,year==1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(select(veh.year, year))

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
wheel.2 <- filter(vehicles, drive == "2-Wheel Drive", cty > 20)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
veh.ID <- select(filter(wheel.2, hwy==min(hwy)) ,id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
most.hwy<-function(this.year,this.make){
  return(filter(filter(vehicles,make == this.make,year==this.year), hwy==max(hwy)))
}

# What was the most efficient honda model of 1995?

most.hwy(1995,"Honda")
