library(jsonlite)

pizza <- fromJSON('data/FavoriteSpots.json')
pizza
pizza$Name
pizza$Details
pizza$Details[[1]]
pizza$Coordinates

class(pizza)
class(pizza$Name)
class(pizza$Details)
class(pizza$Details[[1]])

library(magrittr)

pizza <- fromJSON('data/FavoriteSpots.json') %>% tidyr::unnest()
pizza
