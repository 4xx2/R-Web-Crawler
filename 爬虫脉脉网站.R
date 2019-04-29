url <- "https://maimai.cn/sdk/web/gossip_list?u=226861140&channel=www&version=4.0.0&_csrf=GtPY1Pqb-1UCXSgluo-HKoUOA2NgU0IfV61g&access_token=1.6d0d9cbaa8911b4349ecf2242faf85ae&uid=%22DoFbJ5D58CqH202uOL48avAirs3A3wL6ApgZu%2Fo1crA%3D%22&token=%22I8E%2BDmRw7Nh3b8bTs5hIsin3w9XugkGIfIJ%2FtbOXMnlx%2Brv%2Blp9%2B1g7M0kWicq3P8CKuzcDfAvoCmBm7%2BjVysA%3D%3D%22&page=0&jsononly=1"

#Read HTML, Extract text, and convert JSON format
ct <- url %>% 
    read_html(encoding="utf-8") %>% 
    html_text() %>% 
    fromJSON()

text <- ct$data$text
author <- ct$data$author
time <- ct$data$time
collection <- tibble(text,author,time)

#批量抓取1000条
url_1 <- "https://maimai.cn/sdk/web/gossip_list?u=226861140&channel=www&version=4.0.0&_csrf=w4HKwq9a-_XClwGFeoMl2oglAXTDMb23r1UY&access_token=1.6d0d9cbaa8911b4349ecf2242faf85ae&uid=%22DoFbJ5D58CqH202uOL48avAirs3A3wL6ApgZu%2Fo1crA%3D%22&token=%22I8E%2BDmRw7Nh3b8bTs5hIsin3w9XugkGIfIJ%2FtbOXMnlx%2Brv%2Blp9%2B1g7M0kWicq3P8CKuzcDfAvoCmBm7%2BjVysA%3D%3D%22&page="
url_2 <- "&jsononly=1"
collection <- tibble(text=character(),author=character(),time=character())
for (i in 0:100){
    url <- paste0(url_1,i,url_2)
    ct <- url %>%
        read_html(encoding="utf-8") %>% 
        html_text() %>% 
        fromJSON()
    collection <- bind_rows(collection, tibble(text=ct$data$text,author=ct$data$author,time=ct$data$time))
}
