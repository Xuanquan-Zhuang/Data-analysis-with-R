#=================================
# A Gramma of Data Manipulation
#
# Author: Messiah Chong
#
# When working with data you must:
#   Figure out what you want to do.
#   Describe those tasks in the form of a computer program.
#   Execute the program.
# The dplyr package makes these steps fast and easy:
#   By constraining your options, it helps you think about
#   your data manipulation challenges.
#   It provides simple "verbs", functions that correspond to
#   the most common data manipulation tasks, to help you translate
#   your thoughts into code.
#   It uses efficient backends, so you spend less time waiting for
#   the computer.
#
# Use dataset nycflights13.
#=================================
library(dplyr)
library(nycflights13)

dim(flights) # check whether the size is 336,776 * 19

head(flights,10)
#---------------------------------
# Dplyr aims to provide a function for each basic verb of data manipulation:
#   filter() to select cases based on their values.
#   arrange() to reorder the cases.
#   select() and rename() to select variables based on their names.
#   mutate() and transmute() to add new variables that are functions
#   of existing variables.
#   summarise() to condense multiple values to a single value.
#   sample_n() and sample_frac() to take random samples.
#---------------------------------
filter(flights,month == 1,day == 1) # select all flights on January 1st

arrange(flights,dep_delay,arr_time) # reorder data by two columns
arrange(flights,dep_delay,desc(arr_time)) # descending order

select(flights,year,month,day) # select columns by name
select(flights,year:day) # select columns like numeric method
select(flights,-(year:day)) # select all columns except those from year to day
select(flights,tail_num = tailnum) # select tailnum and rename as tail_num

rename(flights,tial_num = tailnum) # just change the name

mutate(flights,gain = arr_delay - dep_delay,
       speed = distance / air_time * 60) # add new columns that are functions
                                         # of existing columns
mutate(flights,gain = arr_delay - dep_delay,
       gain_per_hour = gain / (air_time / 60)) # it allows you to refer to
                                               # columns you've just created

transmute(flights,gain = gain = arr_delay - dep_delay,
          gain_per_hour = gain / (air_time / 60)) # only keep new variables

summarise(flights,delay = mean(dep_delay,na.rm = TRUE))

