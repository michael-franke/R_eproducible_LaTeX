## minimal example of a data analysis in R whose results
## are fed into LaTeX

library(tidyverse)

######################################
## the data
######################################

# look at a simple data set
cars = as_tibble(cars)

######################################
## some plots
### 
### plots are saved to separate files
######################################

# NB: storing output in a variable is necessary to suppress
# creation of "Rplots.pdf" during make

myplot1 = ggplot(cars, aes(x = speed, y = dist)) + 
  geom_point(color = "skyblue") + geom_smooth(method = "lm")
ggsave(myplot1, filename = "plots/myplot1.pdf", width = 8, height = 4.5, scale = 0.5)  

myplot2 = ggplot(cars, aes(x = speed, y = dist)) + 
  geom_point(color = "firebrick") + geom_smooth(method = "lm")
ggsave(myplot2, filename = "plots/myplot2.pdf", width = 8, height = 4.5, scale = 0.5)  

######################################
## summary stats in a table
######################################

# produce some summary statistics
# and write to CSV
stats = cars %>% gather(key = "variable", value = "value") %>% 
  group_by(variable) %>% summarize(mean = mean(value), sd = sd(value))
readr::write_csv(stats, path="R_data_4_TeX/mystats1.csv", col_names = T)

# produce a table with several entries for a key
stats2 = stats %>% gather(key = "stat", value = "value", 2:3)
readr::write_csv(stats2, path="R_data_4_TeX/mystats2.csv", col_names = T)

mymodel <- lm(dist ~ speed, cars)

# create a table with outcome of linear model
# include *named* column with rownames!
myTable = cbind(tibble(Rowname = row.names(summary(mymodel)$coef)), 
                summary(mymodel)$coef %>% as_tibble())
readr::write_csv(myTable, path = "R_data_4_TeX/mytable.csv", col_names = T)

######################################
## various unrelated variables
######################################

# collect a bunch of unassociated variables in a catch-all
# data frame with a fixed structure, common to several projects

myvars = list()
myvars["maxSpeed"] = cars$speed %>% max()
myvars["minDist"]  = cars$dist  %>% min()
myvars["someNumber"] = 1234.567
myvars["someString"] = "Hello World!"

myvars = as_tibble(myvars)
readr::write_csv(myvars, path = "R_data_4_TeX/myvars.csv", col_names = T)
