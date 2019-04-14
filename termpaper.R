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
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 4, byrow = T)
head(nmbs2)

value <- gsub(",", ".", nmbs2)
value[,4] <- gsub("(\\d.\\d)(\\d.\\d)", "\\1", value[,4])
value[,3] <- gsub("(\\d)\\d", "\\1", value[,3])
value <- value[,-2]
value <- value [,-2]
value <- value [,-2]
class(value) <- "numeric"
head(value)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name_list <- gsub("\\s", "", name)
name_list <- matrix(1:100, ncol = 2, byrow = T)
name_list <- name_list[,-2]
name_list <- matrix(1:100, ncol = 1, byrow = T)
head(name_list)

dat <- data.frame(name_list, value)
colnames(dat) <- c("Player ID", "Total Prize Money in $")
dat["Year"] <- NA
dat$Year <- 2018
head(dat)


#trying to loop over pages for top game prize moneys 1998-2018

npages <- 21
game_prizes <- data.frame()

for(i in 1998:2018) {
  url <- paste0("https://www.esportsearnings.com/history/",i,"/games", sep = "")
  src <- read_html(url)
  
  nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')
  nmbs <- html_text(nds)
  nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
  nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 4, byrow = T)
  
  
  nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
  name <- html_text(nds2)
  
  
  part <- data.frame(nmbs2, name)
  game_prizes <- rbind(game_prizes, part)
  
}
  
str(game_prizes)

#event prizes top100 1998 - 2018
npages <- 21
event_prizes <- data.frame()

for(i in 1998:2018) {
  url <- paste0("https://www.esportsearnings.com/history/",i,"/list_events", sep = "")
  src <- read_html(url)
  
  nds <- html_nodes(src, xpath = '//div/div/div/div/div/dl/dd')
  nmbs <- html_text(nds)
  nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
  nmbs2 <- matrix(gsub("[^0123456789,]", "", nmbs), ncol = 2, byrow = T)  
  
  nds2 <- html_nodes(src, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))] | //*+[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')
  loc <- html_text(nds2)
  
  part <- data.frame(nmbs2, loc)
  event_prizes <- rbind(event_prizes, part)
  
}
  
# #API tryout
#high_earn <- fromJSON('https://api.esportsearnings.com/v0/LookupHighestEarningPlayers?apikey=27a22c5b980f900cb6d5b7d0c3d9d548daba6a57abdec2d115919ef8b01745bd&format=json')
# 
#head(high_earn)
