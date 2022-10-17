library(tidyr)
library(dplyr)
library(purrr)
library(readr)
library(stringr)


tab.files <- list.files(path = "B:/_Waymakr/Analytics/betting/", pattern = "*_tab_*", recursive = TRUE, full.names = TRUE, ignore.case = TRUE) 

tab <- tab.files %>% 
  map_df(~read_csv(.x, col_types = cols(), col_names = FALSE)  %>% 
           mutate(across(everything(), as.character))) %>% 
  rename(date = X1, game = X2, home_win = X3, draw = X4, away_win = X5) %>% 
  mutate(
    home_win = as.numeric(home_win),
    away_win = as.numeric(away_win),
    draw = as.numeric(draw),
    home_team = str_extract(game,"^.*(?=\\sv\\s)"),
    away_team = str_extract(game,"(?<=\\sv\\s).*$"),
    broker = "tab"
  ) %>% 
  select(date,home_team,away_team,home_win, draw, away_win, broker)
  

colossal.files <- list.files(path = "B:/_Waymakr/Analytics/betting/", pattern = "*_colossal_*", recursive = TRUE, full.names = TRUE, ignore.case = TRUE) 

colossal <- colossal.files %>% 
  map_df(~read_csv(.x, col_types = cols(), col_names = FALSE)  %>% 
           mutate(across(everything(), as.character))) %>% 
  rename(league = X1, date = X2, home_team = X3, away_team = X4, home_win = X5, draw = X6, away_win = X7) %>% 
  mutate(
  broker = "colossal" 
        ) %>% select(-league)
  

games <-  union_all(tab,colossal) %>% 
    mutate(
    home_win_ratio = 1/home_win,
    draw_ratio = 1/draw,
    away_win_ratio = 1/away_win,
    ) %>% 
  arrange(home_team)


  


