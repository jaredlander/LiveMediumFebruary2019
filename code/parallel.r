theList <- list(A=1:100, B=c(3, 7, 4), C=5, D=23:38)
theList

sum(theList[[1]])
sum(theList[[2]])

library(purrr)

theList %>% map(sum)

theSums <- numeric(length(theList))
theSums
names(theSums) <- names(theList)
theSums

for(i in 1:length(theList))
{
    theSums[i] <- sum(theList[[i]])
}

theSums

library(doParallel)

detectCores()

cl <- makeCluster(3)
cl
class(cl)

registerDoParallel(cl)

foreach(item=theList) %do%
    {
        print(item)
    }

foreach(item=theList) %do%
    {
        sum(item)
    }

result1 <- foreach(item=theList) %do%
    {
        sum(item)
    }
result1

result2 <- foreach(item=theList) %dopar%
    {
        sum(item)
    }
result2

result3 <- foreach(item=theList, .combine=c) %dopar%
    {
        sum(item)
    }
result3

library(tictoc)

system.time(
{foreach(item=theList, .combine=c) %dopar%
        {
            sum(item)
        }
}
)

tic()
result3 <- foreach(item=theList, .combine=c) %dopar%
    {
        sum(item)
    }
toc()

result4 <- foreach(item=theList, .combine=c, .multicombine=TRUE) %dopar%
    {
        sum(item)
    }
result4

map(theList, sum)
lapply(theList, sum)

parLapply(cl=cl, theList, sum)

stopCluster(cl)

library(future)
library(furrr)

plan(multiprocess)
theList %>% map(sum)
theList %>% future_map(sum)
theList %>% future_map_dbl(sum)

data(diamonds, package='ggplot2')
library(dplyr)
library(tidyr)
diamonds

mod1 <- lm(price ~ carat, data=diamonds)
mod1
library(coefplot)
coefplot(mod1)

library(ggplot2)
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
    geom_point() + 
    geom_smooth(method='lm') + 
    facet_wrap( ~ cut)

diamond_mods_1 <- diamonds %>% 
    group_by(cut) %>% 
    nest(carat, price) %>% 
    mutate(
        Model=map(data, ~ lm(price ~ carat, data=.x))
    )

multiplot(diamond_mods_1$Model, single=FALSE) + theme(legend.position='bottom')
diamond_mods_1$Model[[1]]
diamond_mods_1$Model[[2]]
diamond_mods_1$data[[2]]

diamond_mods_2 <- diamonds %>% 
    group_by(cut) %>% 
    nest(carat, price) %>% 
    mutate(
        Model=future_map(data, ~ lm(price ~ carat, data=.x))
    )
diamond_mods_2
multiplot(diamond_mods_2$Model, single=FALSE) + theme(legend.position='bottom')
