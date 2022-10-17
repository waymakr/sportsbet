url_bet365 <- "https://www.bet365.com.au/"

rs_driver_object <- rsDriver(browser = 'chrome',
                             chromever = '106.0.5249.21',
                             verbose = FALSE,
                             port = free_port())

# create a client object
remDr <- rs_driver_object$client

# open a browser
remDr$open()

# maximize window
remDr$maxWindowSize()


# navigate to website
remDr$navigate(url_bet365)
/html/body/div[1]/div/div[4]/div[2]/div/div/div[1]/div/div[2]/div/div[9]/div[2]


tab_1 <- remDr$findElement(using = 'xpath', '//*[@id="result"]/div/customised-template/div/div[1]')

tab_1 <- remDr$findElements(using = 'class name', 'template-item') 

tab_2 <- tab_1$getElementText() %>% 
  purrr::map2_df(function(x))

tab_2 <- lapply(tab_1, function(x) x$getElementsText()) %>%
  unlist()

remDr$

  
