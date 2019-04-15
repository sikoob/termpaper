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
name_list <- matrix(as.character(name_list), ncol = 2, byrow = T)
name_list <- name_list[,-2]
head(name_list)

dat2018 <- data.frame(name_list, value)
colnames(dat2018) <- c("Player ID", "Total Prize Money in $")
dat2018["Year"] <- NA
dat2018$Year <- 2018
head(dat2018)

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

dat2017 <- data.frame(name_list, value)
colnames(dat2018) <- c("Player ID", "Total Prize Money in $")
dat2017["Year"] <- NA
dat2017$Year <- 2017
head(dat2017)

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

dat2016 <- data.frame(name_list, value)
colnames(dat2016) <- c("Player ID", "Total Prize Money in $")
dat2016["Year"] <- NA
dat2016$Year <- 2016
head(dat2016)

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

dat2015 <- data.frame(name_list, value)
colnames(dat2015) <- c("Player ID", "Total Prize Money in $")
dat2015["Year"] <- NA
dat2015$Year <- 2015
head(dat2015)

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

dat2014 <- data.frame(name_list, value)
colnames(dat2014) <- c("Player ID", "Total Prize Money in $")
dat2014["Year"] <- NA
dat2014$Year <- 2014
head(dat2014)

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

dat2013 <- data.frame(name_list, value)
colnames(dat2013) <- c("Player ID", "Total Prize Money in $")
dat2013["Year"] <- NA
dat2013$Year <- 2013
head(dat2013)

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

dat2012 <- data.frame(name_list, value)
colnames(dat2012) <- c("Player ID", "Total Prize Money in $")
dat2012["Year"] <- NA
dat2012$Year <- 2012
head(dat2012)

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

dat2011 <- data.frame(name_list, value)
colnames(dat2011) <- c("Player ID", "Total Prize Money in $")
dat2011["Year"] <- NA
dat2011$Year <- 2011
head(dat2011)

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

dat2010 <- data.frame(name_list, value)
colnames(dat2010) <- c("Player ID", "Total Prize Money in $")
dat2010["Year"] <- NA
dat2010$Year <- 2010
head(dat2010)

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

dat2009 <- data.frame(name_list, value)
colnames(dat2009) <- c("Player ID", "Total Prize Money in $")
dat2009["Year"] <- NA
dat2009$Year <- 2009
head(dat2009)

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

dat2008 <- data.frame(name_list, value)
colnames(dat2008) <- c("Player ID", "Total Prize Money in $")
dat2008["Year"] <- NA
dat2008$Year <- 2008
head(dat2008)

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

dat2007 <- data.frame(name_list, value)
colnames(dat2007) <- c("Player ID", "Total Prize Money in $")
dat2007["Year"] <- NA
dat2007$Year <- 2007
head(dat2007)

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

dat2006 <- data.frame(name_list, value)
colnames(dat2006) <- c("Player ID", "Total Prize Money in $")
dat2006["Year"] <- NA
dat2006$Year <- 2006
head(dat2006)

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

dat2005 <- data.frame(name_list, value)
colnames(dat2005) <- c("Player ID", "Total Prize Money in $")
dat2005["Year"] <- NA
dat2005$Year <- 2005
head(dat2005)

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

dat2004 <- data.frame(name_list, value)
colnames(dat2004) <- c("Player ID", "Total Prize Money in $")
dat2004["Year"] <- NA
dat2004$Year <- 2004
head(dat2004)

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

dat2003 <- data.frame(name_list, value)
colnames(dat2003) <- c("Player ID", "Total Prize Money in $")
dat2003["Year"] <- NA
dat2009$Year <- 2003
head(dat2003)

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

dat2002 <- data.frame(name_list, value)
colnames(dat2002) <- c("Player ID", "Total Prize Money in $")
dat2002["Year"] <- NA
dat2002$Year <- 2002
head(dat2002)

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

dat2001 <- data.frame(name_list, value)
colnames(dat2001) <- c("Player ID", "Total Prize Money in $")
dat2001["Year"] <- NA
dat2001$Year <- 2001
head(dat2001)

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

dat2000 <- data.frame(name_list, value)
colnames(dat2000) <- c("Player ID", "Total Prize Money in $")
dat2000["Year"] <- NA
dat2000$Year <- 2000
head(dat2000)

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

dat1999 <- data.frame(name_list, value)
colnames(dat1999) <- c("Player ID", "Total Prize Money in $")
dat1999["Year"] <- NA
dat1999$Year <- 1999
head(dat1999)

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

dat1998 <- data.frame(name_list, value)
colnames(dat1998) <- c("Player ID", "Total Prize Money in $")
dat1998["Year"] <- NA
dat1998$Year <- 1998
head(dat1998)



# #trying to loop over pages for top game prize moneys 1998-2018
# 
# npages <- 21
# game_prizes <- data.frame()
# 
# for(i in 1:npages) {
#   url <- paste0("https://www.esportsearnings.com/history/",i,"/games", sep = "")
#   src <- read_html(url)
#   
#   nds <- html_nodes(src, xpath = '//*+[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')
#   nmbs <- html_text(nds)
#   nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
#   class(nmbs) <- "numeric"
#   
#   
#   nds2 <- html_nodes(src, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]')
#   name <- html_text(nds2)
#   name <- matrix(as.character(name), ncol = 2, byrow = T)
#   
#   
#   part <- data.frame(nmbs, name)
#   game_prizes <- rbind(game_prizes, part)
#   
# }
#   
# str(game_prizes)
# 
# #event prizes top100 1998 - 2018
# npages <- 21
# event_prizes <- data.frame()
# 
# for(i in 1998:2018) {
#   url <- paste0("https://www.esportsearnings.com/history/",i,"/list_events", sep = "")
#   src <- read_html(url)
#   
#   nds <- html_nodes(src, xpath = '//div/div/div/div/div/dl/dd')
#   nmbs <- html_text(nds)
#   nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
#   nmbs2 <- matrix(gsub("[^0123456789,]", "", nmbs), ncol = 2, byrow = T)  
#   
#   nds2 <- html_nodes(src, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))] | //*+[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')
#   loc <- html_text(nds2)
#   
#   part <- data.frame(nmbs2, loc)
#   event_prizes <- rbind(event_prizes, part)
#   
# }
#   
# # #API tryout
# #high_earn <- fromJSON('https://api.esportsearnings.com/v0/LookupHighestEarningPlayers?apikey=27a22c5b980f900cb6d5b7d0c3d9d548daba6a57abdec2d115919ef8b01745bd&format=json')
# # 
# #head(high_earn)
