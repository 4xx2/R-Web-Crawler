url <- "https://maimai.cn/sdk/web/gossip_list?u=226861140&channel=www&version=4.0.0&_csrf=GtPY1Pqb-1UCXSgluo-HKoUOA2NgU0IfV61g&access_token=1.6d0d9cbaa8911b4349ecf2242faf85ae&uid=%22DoFbJ5D58CqH202uOL48avAirs3A3wL6ApgZu%2Fo1crA%3D%22&token=%22I8E%2BDmRw7Nh3b8bTs5hIsin3w9XugkGIfIJ%2FtbOXMnlx%2Brv%2Blp9%2B1g7M0kWicq3P8CKuzcDfAvoCmBm7%2BjVysA%3D%3D%22&page=0&jsononly=1"

#Read HTML, Extract text, and convert JSON format
ct <- url %>% 
    read_html(encoding="utf-8") %>% 
    html_text() %>% 
    fromJSON()

text <- ct$data$text
author <- ct$data$author
time <- ct$data$time

data <- tibble(text,author,time)
data
