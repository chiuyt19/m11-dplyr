# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
new.data<-flights %>% group_by(month) %>% summarise(mean=mean(dep_delay,na.rm=TRUE)) 

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
plot(new.data)
# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
de.airport<-flights %>% group_by(dest) %>% summarise(mean=mean(arr_delay, na.rm=TRUE)) %>% arrange(mean)

### Bonus ###
# Which city was flown to with the highest average speed?
