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
