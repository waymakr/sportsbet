brasil_a <- sb_brasil_a %>% 
  union_all(col_brasil_a) %>% 
  arrange(home)


brasil_a_table <- read_html("https://www.brasileirao.com.br/") %>% 
  html_table() %>% 
  lapply()