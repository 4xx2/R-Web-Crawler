library(rvest)
library(rlist)
url <- "http://news.baidu.com/ns?cl=2&rn=20&tn=news&word=%E7%89%B9%E6%9C%97%E6%99%AE&ie=utf-8"
webpage <- read_html(url, encoding = "utf-8")
title <- webpage %>% 
    html_nodes(".c-title a") %>% 
    html_text()
title <- gsub(" ","", gsub("\n","",title))
author_date <- webpage %>% 
    html_nodes(".c-author") %>% 
    html_text()
author <- gsub("\\s","", gsub("\t.*","", gsub("\n","",author_date)))
date <- gsub("\n","", unlist(lapply(strsplit(author_date,"\t"),function(x) x[11])))

tibble(author,title,date)






