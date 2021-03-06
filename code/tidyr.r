reaction <- readr::read_tsv('data/reaction.txt')
reaction

library(tidyr)

reaction %>% gather(key=Stat, value=Data, Age, BMI, React, Regulate)
reaction %>% gather(key=Stat, value=Data, Age, BMI, React, Regulate) %>% 
    dplyr::arrange(ID, Test)

reactLong <- reaction %>% gather(key=Stat, value=Data, Age, BMI, React, Regulate)
reactLong

reactLong %>% spread(key=Stat, value=Data)
