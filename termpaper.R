#install.packages("xml2")
#install.packages("rvest")
#install.packages("jsonlite")
#install.packages("RSocrata")
#install.packages("tidyverse")
# if(!require(devtools)) install.packages("devtools")
# devtools::install_github("kassambara/ggpubr")
# install.packages("ggpubr")
#install.packages("dplyr")
#install.packages("car")
#update.packages(ask=FALSE)

library(gtrendsR)
library(xml2)
library(rvest)
library(jsonlite)
library(RSocrata)
library(tidyverse)
library(magrittr)
library(stringr)
library(car)


#?gtrends

esport <- gtrends(c("esport"))
plot(esport)

esports <- gtrends(c("esports"))
plot(esports)


games <- gtrends(c("Call of Duty: WWII", "StarCraft II", "Heartstone", "Heroes of the Storm", "Overwatch")) 
plot(games)

games2 <- gtrends(c("PlayerUnknown's Battleground", "League of Legends", "Fortnite", "Counter Strike: Global Offensive", "Dota 2"))
plot(games2)

games_y <- gtrends(c("Call of Duty: WWII", "StarCraft II", "Heartstone", "Heroes of the Storm", "Overwatch"), gprop="youtube") 
plot(games_y)

games2_y <- gtrends(c("PlayerUnknown's Battleground", "League of Legends", "Fortnite", "Counter Strike: Global Offensive", "Dota 2"), gprop= "youtube")
plot(games2_y)

#getting lists of top players and games/teams ---------------------------------

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2018 <- data.frame(name_list, value)
colnames(dat_p_2018) <- c("player", "prize_money")
dat_p_2018["Year"] <- NA
dat_p_2018$Year <- 2018
head(dat_p_2018)

url <- read_html("https://www.esportsearnings.com/history/2017/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs)

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2017 <- data.frame(name_list, value)
colnames(dat_p_2017) <- c("player", "prize_money")
dat_p_2017["Year"] <- NA
dat_p_2017$Year <- 2017
head(dat_p_2017)

url <- read_html("https://www.esportsearnings.com/history/2016/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2016 <- data.frame(name_list, value)
colnames(dat_p_2016) <- c("player", "prize_money")
dat_p_2016["Year"] <- NA
dat_p_2016$Year <- 2016
head(dat_p_2016)

url <- read_html("https://www.esportsearnings.com/history/2015/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2015 <- data.frame(name_list, value)
colnames(dat_p_2015) <- c("player", "prize_money")
dat_p_2015["Year"] <- NA
dat_p_2015$Year <- 2015
head(dat_p_2015)

url <- read_html("https://www.esportsearnings.com/history/2014/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2014 <- data.frame(name_list, value)
colnames(dat_p_2014) <- c("player", "prize_money")
dat_p_2014["Year"] <- NA
dat_p_2014$Year <- 2014
head(dat_p_2014)

url <- read_html("https://www.esportsearnings.com/history/2013/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2013 <- data.frame(name_list, value)
colnames(dat_p_2013) <- c("player", "prize_money")
dat_p_2013["Year"] <- NA
dat_p_2013$Year <- 2013
head(dat_p_2013)

url <- read_html("https://www.esportsearnings.com/history/2012/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2012 <- data.frame(name_list, value)
colnames(dat_p_2012) <- c("player", "prize_money")
dat_p_2012["Year"] <- NA
dat_p_2012$Year <- 2012
head(dat_p_2012)

url <- read_html("https://www.esportsearnings.com/history/2011/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2011 <- data.frame(name_list, value)
colnames(dat_p_2011) <- c("player", "prize_money")
dat_p_2011["Year"] <- NA
dat_p_2011$Year <- 2011
head(dat_p_2011)

url <- read_html("https://www.esportsearnings.com/history/2010/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2010 <- data.frame(name_list, value)
colnames(dat_p_2010) <- c("player", "prize_money")
dat_p_2010["Year"] <- NA
dat_p_2010$Year <- 2010
head(dat_p_2010)

url <- read_html("https://www.esportsearnings.com/history/2009/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2009 <- data.frame(name_list, value)
colnames(dat_p_2009) <- c("player", "prize_money")
dat_p_2009["Year"] <- NA
dat_p_2009$Year <- 2009
head(dat_p_2009)

url <- read_html("https://www.esportsearnings.com/history/2008/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2008 <- data.frame(name_list, value)
colnames(dat_p_2008) <- c("player", "prize_money")
dat_p_2008["Year"] <- NA
dat_p_2008$Year <- 2008
head(dat_p_2008)

url <- read_html("https://www.esportsearnings.com/history/2007/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2007 <- data.frame(name_list, value)
colnames(dat_p_2007) <- c("player", "prize_money")
dat_p_2007["Year"] <- NA
dat_p_2007$Year <- 2007
head(dat_p_2007)

url <- read_html("https://www.esportsearnings.com/history/2006/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2006 <- data.frame(name_list, value)
colnames(dat_p_2006) <- c("player", "prize_money")
dat_p_2006["Year"] <- NA
dat_p_2006$Year <- 2006
head(dat_p_2006)

url <- read_html("https://www.esportsearnings.com/history/2005/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2005 <- data.frame(name_list, value)
colnames(dat_p_2005) <- c("player", "prize_money")
dat_p_2005["Year"] <- NA
dat_p_2005$Year <- 2005
head(dat_p_2005)

url <- read_html("https://www.esportsearnings.com/history/2004/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2004 <- data.frame(name_list, value)
colnames(dat_p_2004) <- c("player", "prize_money")
dat_p_2004["Year"] <- NA
dat_p_2004$Year <- 2004
head(dat_p_2004)

url <- read_html("https://www.esportsearnings.com/history/2003/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2003 <- data.frame(name_list, value)
colnames(dat_p_2003) <- c("player", "prize_money")
dat_p_2003["Year"] <- NA
dat_p_2003$Year <- 2003
head(dat_p_2003)

url <- read_html("https://www.esportsearnings.com/history/2002/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2002 <- data.frame(name_list, value)
colnames(dat_p_2002) <- c("player", "prize_money")
dat_p_2002["Year"] <- NA
dat_p_2002$Year <- 2002
head(dat_p_2002)

url <- read_html("https://www.esportsearnings.com/history/2001/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2001 <- data.frame(name_list, value)
colnames(dat_p_2001) <- c("player", "prize_money")
dat_p_2001["Year"] <- NA
dat_p_2001$Year <- 2001
head(dat_p_2001)

url <- read_html("https://www.esportsearnings.com/history/2000/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_2000 <- data.frame(name_list, value)
colnames(dat_p_2000) <- c("player", "prize_money")
dat_p_2000["Year"] <- NA
dat_p_2000$Year <- 2000
head(dat_p_2000)

url <- read_html("https://www.esportsearnings.com/history/1999/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_1999 <- data.frame(name_list, value)
colnames(dat_p_1999) <- c("player", "prize_money")
dat_p_1999["Year"] <- NA
dat_p_1999$Year <- 1999
head(dat_p_1999)

url <- read_html("https://www.esportsearnings.com/history/1998/top_players")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat_p_1998 <- data.frame(name_list, value)
colnames(dat_p_1998) <- c("player", "prize_money")
dat_p_1998["Year"] <- NA
dat_p_1998$Year <- 1998
head(dat_p_1998)
#list creation top players by year---------------------------------
player_prizes <- rbind(dat_p_2018, dat_p_2017, dat_p_2016, dat_p_2015, dat_p_2014, dat_p_2013, dat_p_2012, dat_p_2011, dat_p_2010, 
                       dat_p_2009, dat_p_2008, dat_p_2007, dat_p_2006, dat_p_2005, dat_p_2004, dat_p_2003, dat_p_2002, 
                       dat_p_2001, dat_p_2000, dat_p_1999, dat_p_1998)

str(player_prizes)

player_prizes["ID"] <- NA
player_prizes$ID <- 1:2001
player_prizes["Count"] <- NA
player_prizes$Count <- 1
str(player_prizes)


#gathering team information =================================
url <- read_html("https://www.esportsearnings.com/history/2018/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2018 <- data.frame(name, nmbs2)
colnames(dat_t_2018) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2018["Year"] <- NA
dat_t_2018$Year <- 2018
dat_t_2018[,2] <- as.numeric(as.character(dat_t_2018[,2] ))
head(dat_t_2018)

url <- read_html("https://www.esportsearnings.com/history/2017/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2017 <- data.frame(name, nmbs2)
colnames(dat_t_2017) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2017["Year"] <- NA
dat_t_2017$Year <- 2017
dat_t_2017[,2] <- as.numeric(as.character(dat_t_2017[,2] ))
head(dat_t_2017)

url <- read_html("https://www.esportsearnings.com/history/2016/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2016 <- data.frame(name, nmbs2)
colnames(dat_t_2016) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2016["Year"] <- NA
dat_t_2016$Year <- 2016
dat_t_2016[,2] <- as.numeric(as.character(dat_t_2016[,2] ))
head(dat_t_2016)

url <- read_html("https://www.esportsearnings.com/history/2015/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2015 <- data.frame(name, nmbs2)
colnames(dat_t_2015) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2015["Year"] <- NA
dat_t_2015$Year <- 2015
dat_t_2015[,2] <- as.numeric(as.character(dat_t_2015[,2] ))
head(dat_t_2015)

url <- read_html("https://www.esportsearnings.com/history/2014/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2014 <- data.frame(name, nmbs2)
colnames(dat_t_2014) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2014["Year"] <- NA
dat_t_2014$Year <- 2014
dat_t_2014[,2] <- as.numeric(as.character(dat_t_2014[,2] ))
head(dat_t_2014)

url <- read_html("https://www.esportsearnings.com/history/2013/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2013 <- data.frame(name, nmbs2)
colnames(dat_t_2013) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2013["Year"] <- NA
dat_t_2013$Year <- 2013
dat_t_2013[,2] <- as.numeric(as.character(dat_t_2013[,2] ))
head(dat_t_2013)

url <- read_html("https://www.esportsearnings.com/history/2012/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2012 <- data.frame(name, nmbs2)
colnames(dat_t_2012) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2012["Year"] <- NA
dat_t_2012$Year <- 2012
dat_t_2012[,2] <- as.numeric(as.character(dat_t_2012[,2] ))
head(dat_t_2012)

url <- read_html("https://www.esportsearnings.com/history/2011/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2011 <- data.frame(name, nmbs2)
colnames(dat_t_2011) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2011["Year"] <- NA
dat_t_2011$Year <- 2011
dat_t_2011[,2] <- as.numeric(as.character(dat_t_2011[,2] ))
head(dat_t_2011)

url <- read_html("https://www.esportsearnings.com/history/2010/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2010 <- data.frame(name, nmbs2)
colnames(dat_t_2010) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2010["Year"] <- NA
dat_t_2010$Year <- 2010
dat_t_2010[,2] <- as.numeric(as.character(dat_t_2010[,2] ))
head(dat_t_2010)

url <- read_html("https://www.esportsearnings.com/history/2009/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2009 <- data.frame(name, nmbs2)
colnames(dat_t_2009) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2009["Year"] <- NA
dat_t_2009$Year <- 2009
dat_t_2009[,2] <- as.numeric(as.character(dat_t_2009[,2] ))
head(dat_t_2009)

url <- read_html("https://www.esportsearnings.com/history/2008/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2008 <- data.frame(name, nmbs2)
colnames(dat_t_2008) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2008["Year"] <- NA
dat_t_2008$Year <- 2008
dat_t_2008[,2] <- as.numeric(as.character(dat_t_2008[,2] ))
head(dat_t_2008)

url <- read_html("https://www.esportsearnings.com/history/2007/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2007 <- data.frame(name, nmbs2)
colnames(dat_t_2007) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2007["Year"] <- NA
dat_t_2007$Year <- 2007
dat_t_2007[,2] <- as.numeric(as.character(dat_t_2007[,2] ))
head(dat_t_2007)

url <- read_html("https://www.esportsearnings.com/history/2006/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2006 <- data.frame(name, nmbs2)
colnames(dat_t_2006) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2006["Year"] <- NA
dat_t_2006$Year <- 2006
dat_t_2006[,2] <- as.numeric(as.character(dat_t_2006[,2] ))
head(dat_t_2006)

url <- read_html("https://www.esportsearnings.com/history/2005/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2005 <- data.frame(name, nmbs2)
colnames(dat_t_2005) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2005["Year"] <- NA
dat_t_2005$Year <- 2005
dat_t_2005[,2] <- as.numeric(as.character(dat_t_2005[,2] ))
head(dat_t_2005)

url <- read_html("https://www.esportsearnings.com/history/2004/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2004 <- data.frame(name, nmbs2)
colnames(dat_t_2004) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2004["Year"] <- NA
dat_t_2004$Year <- 2004
dat_t_2004[,2] <- as.numeric(as.character(dat_t_2004[,2] ))
head(dat_t_2004)

url <- read_html("https://www.esportsearnings.com/history/2003/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2003 <- data.frame(name, nmbs2)
colnames(dat_t_2003) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2003["Year"] <- NA
dat_t_2003$Year <- 2003
dat_t_2003[,2] <- as.numeric(as.character(dat_t_2003[,2] ))
head(dat_t_2003)

url <- read_html("https://www.esportsearnings.com/history/2002/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2002 <- data.frame(name, nmbs2)
colnames(dat_t_2002) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2002["Year"] <- NA
dat_t_2002$Year <- 2002
dat_t_2002[,2] <- as.numeric(as.character(dat_t_2002[,2] ))
head(dat_t_2002)

url <- read_html("https://www.esportsearnings.com/history/2001/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2001 <- data.frame(name, nmbs2)
colnames(dat_t_2001) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2001["Year"] <- NA
dat_t_2001$Year <- 2001
dat_t_2001[,2] <- as.numeric(as.character(dat_t_2001[,2] ))
head(dat_t_2001)

url <- read_html("https://www.esportsearnings.com/history/2000/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_2000 <- data.frame(name, nmbs2)
colnames(dat_t_2000) <- c("team_name", "prize_money", "number_tournaments")
dat_t_2000["Year"] <- NA
dat_t_2000$Year <- 2000
dat_t_2000[,2] <- as.numeric(as.character(dat_t_2000[,2] ))
head(dat_t_2000)

url <- read_html("https://www.esportsearnings.com/history/1999/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_t_1999 <- data.frame(name, nmbs2)
colnames(dat_t_1999) <- c("team_name", "prize_money", "number_tournaments")
dat_t_1999["Year"] <- NA
dat_t_1999$Year <- 1999
dat_t_1999[,2] <- as.numeric(as.character(dat_t_1999[,2] ))
head(dat_t_1999)

url <- read_html("https://www.esportsearnings.com/history/1998/teams")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs)

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
nmbs2 <- format(nmbs2,2)
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

# dat_t_1998 <- data.frame(name, nmbs2)
# colnames(dat_t_1998) <- c("team_name", "prize_money", "number_tournaments")
# dat_t_1998["Year"] <- NA
# dat_t_1998$Year <- 1998
# dat_t_1998[,2] <- as.numeric(as.character(dat_t_1998[,2] ))
# head(dat_t_1998)            ##no teams in 1998

#code creation top teams by year =================================

team_prizes <- rbind(dat_t_2018, dat_t_2017, dat_t_2016, dat_t_2015, dat_t_2014, dat_t_2013, dat_t_2012, dat_t_2011, dat_t_2010, dat_t_2009, dat_t_2008, dat_t_2007, dat_t_2006, dat_t_2005, dat_t_2004, dat_t_2003, dat_t_2002, dat_t_2001, dat_t_2000, dat_t_1999)
team_prizes["Count"] <- NA
team_prizes$Count <- 1
str(team_prizes)

#data events =================================
url <- read_html("https://www.esportsearnings.com/history/2018/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2018 <- data.frame(name, nmbs2)
colnames(dat_e_2018) <- c("event_name", "Date", "prize_money")
dat_e_2018["Year"] <- NA
dat_e_2018$Year <- 2018
dat_e_2018$Date <- NULL 
dat_e_2018[,2] <- as.numeric(as.character(dat_e_2018[,2] ))
head(dat_e_2018)

url <- read_html("https://www.esportsearnings.com/history/2017/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2017 <- data.frame(name, nmbs2)
colnames(dat_e_2017) <- c("event_name", "Date", "prize_money")
dat_e_2017["Year"] <- NA
dat_e_2017$Year <- 2017
dat_e_2017$Date <- NULL 
dat_e_2017[,2] <- as.numeric(as.character(dat_e_2017[,2] ))
head(dat_e_2017)

url <- read_html("https://www.esportsearnings.com/history/2016/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2016 <- data.frame(name, nmbs2)
colnames(dat_e_2016) <- c("event_name", "Date", "prize_money")
dat_e_2016["Year"] <- NA
dat_e_2016$Year <- 2016
dat_e_2016$Date <- NULL 
dat_e_2016[,2] <- as.numeric(as.character(dat_e_2016[,2] ))
head(dat_e_2016)

url <- read_html("https://www.esportsearnings.com/history/2015/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2015 <- data.frame(name, nmbs2)
colnames(dat_e_2015) <- c("event_name", "Date", "prize_money")
dat_e_2015["Year"] <- NA
dat_e_2015$Year <- 2015
dat_e_2015$Date <- NULL 
dat_e_2015[,2] <- as.numeric(as.character(dat_e_2015[,2] ))
head(dat_e_2015)

url <- read_html("https://www.esportsearnings.com/history/2014/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2014 <- data.frame(name, nmbs2)
colnames(dat_e_2014) <- c("event_name", "Date", "prize_money")
dat_e_2014["Year"] <- NA
dat_e_2014$Year <- 2014
dat_e_2014$Date <- NULL 
dat_e_2014[,2] <- as.numeric(as.character(dat_e_2014[,2] ))
head(dat_e_2014)

url <- read_html("https://www.esportsearnings.com/history/2013/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2013 <- data.frame(name, nmbs2)
colnames(dat_e_2013) <- c("event_name", "Date", "prize_money")
dat_e_2013["Year"] <- NA
dat_e_2013$Year <- 2013
dat_e_2013$Date <- NULL 
dat_e_2013[,2] <- as.numeric(as.character(dat_e_2013[,2] ))
head(dat_e_2013)

url <- read_html("https://www.esportsearnings.com/history/2012/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2012 <- data.frame(name, nmbs2)
colnames(dat_e_2012) <- c("event_name", "Date", "prize_money")
dat_e_2012["Year"] <- NA
dat_e_2012$Year <- 2012
dat_e_2012$Date <- NULL 
dat_e_2012[,2] <- as.numeric(as.character(dat_e_2012[,2] ))
head(dat_e_2012)

url <- read_html("https://www.esportsearnings.com/history/2011/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2011 <- data.frame(name, nmbs2)
colnames(dat_e_2011) <- c("event_name", "Date", "prize_money")
dat_e_2011["Year"] <- NA
dat_e_2011$Year <- 2011
dat_e_2011$Date <- NULL 
dat_e_2011[,2] <- as.numeric(as.character(dat_e_2011[,2] ))
head(dat_e_2011)

url <- read_html("https://www.esportsearnings.com/history/2010/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2010 <- data.frame(name, nmbs2)
colnames(dat_e_2010) <- c("event_name", "Date", "prize_money")
dat_e_2010["Year"] <- NA
dat_e_2010$Year <- 2010
dat_e_2010$Date <- NULL 
dat_e_2010[,2] <- as.numeric(as.character(dat_e_2010[,2] ))
head(dat_e_2010)

url <- read_html("https://www.esportsearnings.com/history/2009/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2009 <- data.frame(name, nmbs2)
colnames(dat_e_2009) <- c("event_name", "Date", "prize_money")
dat_e_2009["Year"] <- NA
dat_e_2009$Year <- 2009
dat_e_2009$Date <- NULL 
dat_e_2009[,2] <- as.numeric(as.character(dat_e_2009[,2] ))
head(dat_e_2009)

url <- read_html("https://www.esportsearnings.com/history/2008/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2008 <- data.frame(name, nmbs2)
colnames(dat_e_2008) <- c("event_name", "Date", "prize_money")
dat_e_2008["Year"] <- NA
dat_e_2008$Year <- 2008
dat_e_2008$Date <- NULL
dat_e_2008[,2] <- as.numeric(as.character(dat_e_2008[,2] ))
head(dat_e_2008)

url <- read_html("https://www.esportsearnings.com/history/2007/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2007 <- data.frame(name, nmbs2)
colnames(dat_e_2007) <- c("event_name", "Date", "prize_money")
dat_e_2007["Year"] <- NA
dat_e_2007$Year <- 2007
dat_e_2007$Date <- NULL 
dat_e_2007[,2] <- as.numeric(as.character(dat_e_2007[,2] ))
head(dat_e_2007)

url <- read_html("https://www.esportsearnings.com/history/2006/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2006 <- data.frame(name, nmbs2)
colnames(dat_e_2006) <- c("event_name", "Date", "prize_money")
dat_e_2006["Year"] <- NA
dat_e_2006$Year <- 2006
dat_e_2006$Date <- NULL
dat_e_2006[,2] <- as.numeric(as.character(dat_e_2006[,2] ))
head(dat_e_2006)

url <- read_html("https://www.esportsearnings.com/history/2005/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2005 <- data.frame(name, nmbs2)
colnames(dat_e_2005) <- c("event_name", "Date", "prize_money")
dat_e_2005["Year"] <- NA
dat_e_2005$Year <- 2005
dat_e_2005$Date <- NULL 
dat_e_2005[,2] <- as.numeric(as.character(dat_e_2005[,2] ))
head(dat_e_2005)

url <- read_html("https://www.esportsearnings.com/history/2004/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2004 <- data.frame(name, nmbs2)
colnames(dat_e_2004) <- c("event_name", "Date", "prize_money")
dat_e_2004["Year"] <- NA
dat_e_2004$Year <- 2004
dat_e_2004$Date <- NULL 
dat_e_2004[,2] <- as.numeric(as.character(dat_e_2004[,2] ))
head(dat_e_2004)

url <- read_html("https://www.esportsearnings.com/history/2003/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2003 <- data.frame(name, nmbs2)
colnames(dat_e_2003) <- c("event_name", "Date", "prize_money")
dat_e_2003["Year"] <- NA
dat_e_2003$Year <- 2003
dat_e_2003$Date <- NULL 
dat_e_2003[,2] <- as.numeric(as.character(dat_e_2003[,2] ))
head(dat_e_2003)

url <- read_html("https://www.esportsearnings.com/history/2002/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2002 <- data.frame(name, nmbs2)
colnames(dat_e_2002) <- c("event_name", "Date", "prize_money")
dat_e_2002["Year"] <- NA
dat_e_2002$Year <- 2002
dat_e_2002$Date <- NULL 
dat_e_2002[,2] <- as.numeric(as.character(dat_e_2002[,2] ))
head(dat_e_2002)

url <- read_html("https://www.esportsearnings.com/history/2001/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2001 <- data.frame(name, nmbs2)
colnames(dat_e_2001) <- c("event_name", "Date", "prize_money")
dat_e_2001["Year"] <- NA
dat_e_2001$Year <- 2001
dat_e_2001$Date <- NULL
dat_e_2001[,2] <- as.numeric(as.character(dat_e_2001[,2] ))
head(dat_e_2001)

url <- read_html("https://www.esportsearnings.com/history/2000/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2000 <- data.frame(name, nmbs2)
colnames(dat_e_2000) <- c("event_name", "Date", "prize_money")
dat_e_2000["Year"] <- NA
dat_e_2000$Year <- 2000
dat_e_2000$Date <- NULL 
dat_e_2000[,2] <- as.numeric(as.character(dat_e_2000[,2] ))
head(dat_e_2000)

url <- read_html("https://www.esportsearnings.com/history/1999/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_1999 <- data.frame(name, nmbs2)
colnames(dat_e_1999) <- c("event_name", "Date", "prize_money")
dat_e_1999["Year"] <- NA
dat_e_1999$Year <- 1999
dat_e_1999$Date <- NULL
dat_e_1999[,2] <- as.numeric(as.character(dat_e_1999[,2] ))
head(dat_e_1999)

url <- read_html("https://www.esportsearnings.com/history/1998/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(nmbs2) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_1998 <- data.frame(name, nmbs2)
colnames(dat_e_1998) <- c("event_name", "Date", "prize_money")
dat_e_1998["Year"] <- NA
dat_e_1998$Year <- 1998
dat_e_1998$Date <- NULL 
dat_e_1998[,2] <- as.numeric(as.character(dat_e_1998[,2] ))
head(dat_e_1998)

#creating inserted list for events per year =================================
event_prizes <- rbind(dat_e_2018, dat_e_2017, dat_e_2016, dat_e_2015, dat_e_2014, dat_e_2013, dat_e_2012, dat_e_2011, dat_e_2010, dat_e_2009, dat_e_2008, dat_e_2007, dat_e_2006, dat_e_2005, dat_e_2004, dat_e_2003, dat_e_2002, dat_e_2001, dat_e_2000, dat_e_1999, dat_e_1998)
str(event_prizes)
event_prizes["Count"] <- NA
event_prizes$Count <- 1
event_prizes[,2] <- as.numeric(as.character(event_prizes[,2] ))
str(event_prizes)

#calculations  =================================

#getting correlations for events
by_e_year <- group_by(event_prizes, Year) #get information on number of events/players/teams per year


summa_e_prize <- summarize(by_e_year, sum_e_prize=sum(prize_money), na.rm= TRUE)

cor.test(summa_e_prize$Year,summa_e_prize$sum_e_prize, method=c("pearson"))

scatterplot(sum_e_prize ~ Year, data=summa_e_prize, xlab="Year", ylab="Money in Dollar", 
            main="Scatterplot for prize money in $ by year for events", boxplot=FALSE, smooth=FALSE, regLine=FALSE)

summa_e_count <- summarize(by_e_year, sum_e_count=sum(`Count`), na.rm= TRUE)

cor.test(summa_e_count$Year,summa_e_count$sum_e_count, method=c("pearson"))

scatterplot(sum_e_count ~ Year, data=summa_e_count, xlab="Year", ylab="Count of events", 
            main="Scatterplot for count of eSport events by year", boxplot=FALSE, smooth=FALSE, regLine=FALSE)

#getting correlations for teams

by_t_year <- group_by(team_prizes, Year)

summa_t_prize <- summarize(by_t_year, sum_t_prize=sum(prize_money), na.rm= TRUE)

cor.test(summa_t_prize$Year,summa_t_prize$sum_t_prize, method=c("pearson"))

scatterplot(sum_t_prize ~ Year, data=summa_t_prize, xlab="Year", ylab="Money in Dollar", 
            main="Scatterplot for prize money in $ by year for teams", boxplot=FALSE, smooth=FALSE, regLine=FALSE)

summa_t_count <- summarize(by_t_year, sum_t_count=sum(`Count`), na.rm= TRUE)

cor.test(summa_t_count$Year,summa_t_count$sum_t_count, method=c("pearson"))

scatterplot(sum_t_count ~ Year, data=summa_t_count, xlab="Year", ylab="Count of teams", 
            main="Scatterplot for count of eSport teams by year", boxplot=FALSE, smooth=FALSE, regLine=FALSE)

#getting correlations for individual players

by_p_year <- group_by(player_prizes, Year)

summa_p_prize <- summarize(by_p_year, sum_p_prize=sum(prize_money), na.rm= TRUE)

cor.test(summa_p_prize$Year,summa_p_prize$sum_p_prize, method=c("pearson"))

scatterplot(sum_p_prize ~ Year, data=summa_p_prize, xlab="Year", ylab="Money in Dollar", 
            main="Scatterplot for prize money in $ by year for top 100 players", boxplot=FALSE, smooth=FALSE, regLine=FALSE)

