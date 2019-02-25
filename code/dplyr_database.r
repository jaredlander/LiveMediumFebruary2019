# install.packages('dbplyr')

library(dplyr)
library(DBI)

con <- dbConnect(RSQLite::SQLite(), 'data/diamonds.db')
con

dbListTables(con)
dbListFields(con, 'diamonds')
dbListFields(con, 'DiamondColors')

diaTab <- tbl(con, 'diamonds')
diaTab
class(diaTab)

data(diamonds, package='ggplot2')
class(diamonds)

pryr::object_size(diamonds)
pryr::object_size(diaTab)

ncol(diaTab)
nrow(diaTab)

diaTab %>% 
    select(price, carat)
diaTab %>% filter(cut == 'Ideal')

diaTab %>% mutate(Ratio=price/carat)
diaTab

diaTab %>% 
    group_by(cut) %>% 
    summarize(AvgPrice=mean(price))

diaTab %>% 
    group_by(cut) %>% 
    summarize(AvgPrice=AVG(price))

diaTab %>% 
    group_by(cut) %>% 
    summarize(AvgPrice=AVG(price)) %>% 
    show_query()

diaTab %>% 
    filter(carat > 1) %>% 
    group_by(cut) %>% 
    summarize(AvgPrice=AVG(price)) %>% 
    show_query()
