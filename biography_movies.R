install.packages("rvest")
install.packages("dplyr")

library(rvest)
library(dplyr)

link = "https://www.imdb.com/search/title/?title_type=feature&genres=biography&sort=user_rating,desc&explore=genres"
page = read_html(link)

name = page %>% html_nodes(".lister-item-header a") %>% html_text()
year = page %>% html_nodes() %>%  html_text()
duration = page %>%  html_nodes() %>% html_text()
rating = page %>% html_nodes() %>%  html_text()
synopsis = page %>% html_nodes() %>%  html_text()

movies = data.frame(name, year, duration, rating, synopsis, stringsAsFactors = FALSE)