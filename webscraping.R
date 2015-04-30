library(rvest)

url <- "http://www.realtor.com/international/search-listing/Queretaro_MX_SMX0025?source=web"

first <- html(url)

addresses <- first %>% html_nodes("#lblAddress") %>% html_text()
pricesUS <- first %>% html_nodes("#lblPriceConverted")

secondPage <- "http://www.realtor.com/international/search-listing/Queretaro_MX_SMX0025/pg-2/?source=web"

for (i in 2:106) {
  pgNum <- paste("pg-", as.character(i), sep ="")
  urlCurrent <- gsub(pattern = "pg-([[:digit:]]+)", replacement = pgNum, x = secondPage)
  current <- html(urlCurrent)
  currentAdd <- current %>% html_nodes("#lblAddress") %>% html_text()
  currentPri <- current %>% html_nodes("#lblAddress") %>% html_text()
  addresses <- c(addresses, current)
  pricesUS <- c(pricesUS, current)
  sys.sleep(5)
}

