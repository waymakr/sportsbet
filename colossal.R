
col_brasil_a_csv <- read_csv(here("data","matches_colossal_brasil_a.csv"), col_names = FALSE) %>% 
  
col_brasil_a <- col_brasil_a_csv %>% tidyr::pivot_longer(everything(),names_to = "col") %>% 
                drop_na(value) %>% 
  separate_rows(value, sep = "\n") %>% 
  mutate(
    value = str_remove_all(value,"\r")
  ) %>% 
  filter(
    !str_detect(value,"^Show"),
    !str_detect(value,"^--")
  ) %>% 
  group_by(grp = str_c('value', rep(1:7, length.out = n()))) %>%
  mutate(rn = row_number()) %>%
  ungroup %>%
  pivot_wider(names_from = grp, values_from = value) %>%
  select(-rn, -col) %>% 
  rename(match = value1, home = value2, away = value6) %>% 
  mutate(
    agency = "colossalbet",
    home_win = as.numeric(value3),
    draw = as.numeric(value5),
    away_win = as.numeric(value7),
    home_ratio = 1/home_win,
    draw_ratio = 1/draw,
    away_ratio = 1/away_win,
    total_ratio = home_ratio + draw_ratio + away_ratio
  ) %>% 
  select(agency,home,away,home_win,draw,away_win,home_ratio,draw_ratio,away_ratio,total_ratio)

