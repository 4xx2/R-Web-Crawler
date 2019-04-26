url <- "http://www.espn.com/nba/standings"
dt1 <- readHTMLTable(url,header=TRUE)

east_team <- dt1[[2]][,1]
east_team <- substring(east_team, regexpr("-",east_team)+2)
east_score <- dt1[[4]]
east_score$team <- east_team

west_team <- dt1[[6]][,1]
west_team <- substring(west_team, regexpr("-",west_team)+2)
west_score <- dt1[[8]]
west_score$team <- west_team


