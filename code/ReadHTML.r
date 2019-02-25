library(rvest)

ribalta <- read_html('data/ribalta.html')
class(ribalta)

ribalta %>% html_nodes('ul')
ribalta %>% html_nodes('ul') %>% html_nodes('li')
ribalta %>% html_nodes('ul') %>% html_nodes('li.address')
ribalta %>% html_nodes('ul') %>% html_nodes('li.address') %>% html_nodes('span.street')

ribalta %>% 
    html_nodes('ul') %>% 
    html_nodes('li.address') %>% 
    html_nodes('span.street') %>% 
    html_text()

ribalta %>% html_nodes('.street')
ribalta %>% html_nodes('.street') %>% html_text()

ribalta %>% html_nodes('#latitude')
ribalta %>% html_nodes('span#latitude')
ribalta %>% html_nodes('#latitude') %>% html_attr('value')


ribalta %>% 
    html_nodes('table.food-items')

ribalta %>% 
    html_nodes('table.food-items') %>% 
    magrittr::extract2(5) %>% 
    html_table()

ribalta %>% 
    html_nodes('table.food-items') %>% 
    purrr::map(html_table, fill=TRUE)

ribalta %>% 
    html_nodes('table.food-items') %>% 
    purrr::map_df(html_table, fill=TRUE, .id='Type') %>% 
    tibble::as_tibble()