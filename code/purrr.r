library(purrr)

c(1, 2, 4, 8)
c('a', 'b', 'w', 'e')

list('pool', 42)

list(c('red', 'blue', 'green'), c(1, 7, 1, 5, 3, 8))

list1 <- list(c('red', 'blue', 'green'), c(1, 7, 1, 5, 3, 8))
list1

list2 <- list(1:5, list1, iris)
list2


list3 <- list(1:100, 17, c(3, 1, 2, 8))
list3

list3[[1]]
list3[[2]]
list3[[3]]

sum(list3[[1]])
sum(list3[[2]])
sum(list3[[3]])

map(list3, sum)
list3 %>% map(sum)

list3 %>% map_dbl(sum)
list3 %>% map_int(sum)

list3 %>% map(mean)
list3 %>% map_dbl(mean)
list3 %>% map_int(mean)

class(17)
class(sum(17))
class(1:100)
class(sum(1:100))

list3 %>% map(class)
list3 %>% map_chr(class)
