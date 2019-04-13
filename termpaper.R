#install.packages("devtools")
#devtools::install_github("PMassicotte/gtrendsR")

#install.packages("xml2")
#install.packages("rvest")
#install.packages("jsonlite")
#install.packages("RSocrata")
#install.packages("tidyverse")

library(gtrendsR)
library(xml2)
library(rvest)
library(jsonlite)
library(RSocrata)
library(tidyverse)
library(magrittr)
library(stringr)

?gtrends

res <- gtrends(c("esports"))
plot(res)

res <- gtrends(c("League of Legends", "Fortnite", "Fifa"))
plot(res)

res <- gtrends(c("League of Legends", "Fortnite", "Fifa"), gprop="youtube")
plot(res)

#getting lists of top players and games/teams

url <- read_html("https://www.esportsearnings.com/history/2018/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) #income list top100 players 2018

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789,]", "", nmbs), ncol = 4, byrow = T)
head(nmbs2)

?gsub

value <- gsub(".", ".", nmbs2)
value[,4] <- gsub("%","",value[,4])/100
value[,3] <- gsub("(\\d)\\d", "\\1.\d[:punct]", value[,3])
class(value) <- "numeric"
head(value)

# nds2 <- html_nodes(url, xpath = '//*+[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]//a | //a+//a')
# 
# name <- html_text(nds2)
# head(name)
# 
# dat <- data.frame(name, value)
# colnames(dat) <- c("Player ID", "Player Name", "Total Prize Money in 2019", "Overall Prize Money", "Share of 2019's prize money")
# dat


#trying to loop over pages for top games

npages <- 21
game_prizes <- data.frame()

for(i in 1998:2018) {
  url <- paste0("https://www.esportsearnings.com/history/",i,"/games", sep = "")
  src <- read_html(url)
  
  nds <- html_nodes(src, xpath = '//div/div/div/div/div/dl/dd')
  nmbs <- html_text(nds)
  nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
  nmbs2 <- matrix(gsub("[^0123456789,]", "", nmbs), ncol = 2, byrow = T)  
  
  nds2 <- html_nodes(src, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))] | //*+[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')
  loc <- html_text(nds2)
  
  part <- data.frame(nmbs2, loc)
  game_prizes <- rbind(game_prizes, part)
  
}
  
str(game_prizes)
  
# #API tryout
#high_earn <- fromJSON('https://api.esportsearnings.com/v0/LookupHighestEarningPlayers?apikey=27a22c5b980f900cb6d5b7d0c3d9d548daba6a57abdec2d115919ef8b01745bd&format=json')
# 
#head(high_earn)
