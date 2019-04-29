#导入Library
library(jiebaR)
library(tidyverse)
library(rvest)
library(wordcloud2)


#导入链接
url <- "http://www.gov.cn/premier/2017-03/16/content_5177940.htm"

#把链接中的正文内容转化成text
text <- url %>% 
    read_html(encoding="utf-8") %>% 
    html_nodes("div.pages_content") %>% 
    html_text()

#定义中文stopwords
stopwords_CN <- c("被","怎么","还是","多少","得", "吗","给","年","月","还","个","能", "日","什么","做","没","啊", "的", "了", "在", "是", "我", "有", "和", "就","不", "人", "都", "一", "一个", "上", "也", "很", "到", "说", "要", "去", "你","会", "着", "没有", "看", "好", "自己", "这", "等")

#初始化分词引擎
engine <- worker()
#开始分词
seg <- segment(text,engine)
path <- "C:/Heraeus Work/R program/t.png"
tibble(seg) %>% 
    count(seg,sort=TRUE) %>% 
    filter(!seg %in% stopwords_CN) %>% 
    top_n(150) %>% 
    wordcloud2(size=1,shape="star")
