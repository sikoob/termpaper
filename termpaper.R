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
colnames(dat2017) <- c("Player ID", "Total Prize Money in $")
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
dat2003$Year <- 2003
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
#list creation top players by year---------------------------------
player_prizes <- rbind(dat2018, dat2017, dat2016, dat2015, dat2014, dat2013, dat2012, dat2011, dat2010, dat2009, dat2008, dat2007, dat2006, dat2005, dat2004, dat2003, dat2002, dat2001, dat2000, dat1999, dat1998)

str(player_prizes)

player_prizes["ID"] <- NA
player_prizes$ID <- 1:2001
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
colnames(dat_t_2018) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2018["Year"] <- NA
dat_t_2018$Year <- 2018
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
colnames(dat_t_2017) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2017["Year"] <- NA
dat_t_2017$Year <- 2017
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
colnames(dat_t_2016) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2016["Year"] <- NA
dat_t_2016$Year <- 2016
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
colnames(dat_t_2015) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2015["Year"] <- NA
dat_t_2015$Year <- 2015
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
colnames(dat_t_2014) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2014["Year"] <- NA
dat_t_2014$Year <- 2014
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
colnames(dat_t_2013) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2013["Year"] <- NA
dat_t_2013$Year <- 2013
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
colnames(dat_t_2012) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2012["Year"] <- NA
dat_t_2012$Year <- 2012
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
colnames(dat_t_2011) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2011["Year"] <- NA
dat_t_2011$Year <- 2011
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
colnames(dat_t_2010) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2010["Year"] <- NA
dat_t_2010$Year <- 2010
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
colnames(dat_t_2009) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2009["Year"] <- NA
dat_t_2009$Year <- 2009
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
colnames(dat_t_2008) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2008["Year"] <- NA
dat_t_2008$Year <- 2008
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
colnames(dat_t_2007) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2007["Year"] <- NA
dat_t_2007$Year <- 2007
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
colnames(dat_t_2006) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2006["Year"] <- NA
dat_t_2006$Year <- 2006
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
colnames(dat_t_2005) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2005["Year"] <- NA
dat_t_2005$Year <- 2005
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
colnames(dat_t_2004) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2004["Year"] <- NA
dat_t_2004$Year <- 2004
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
colnames(dat_t_2003) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2003["Year"] <- NA
dat_t_2003$Year <- 2003
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
colnames(dat_t_2002) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2002["Year"] <- NA
dat_t_2002$Year <- 2002
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
colnames(dat_t_2001) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2001["Year"] <- NA
dat_t_2001$Year <- 2001
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
colnames(dat_t_2000) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_2000["Year"] <- NA
dat_t_2000$Year <- 2000
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
colnames(dat_t_1999) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_1999["Year"] <- NA
dat_t_1999$Year <- 1999
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

dat_t_1998 <- data.frame(name, nmbs2)
colnames(dat_t_1998) <- c("Team Name", "Total Prize Money in $", "Number of Tournaments")
dat_t_1998["Year"] <- NA
dat_t_1998$Year <- 1998
head(dat_t_1998)

#code creation top teams by year =================================

team_prizes <- rbind(dat_t_2018, dat_t_2017, dat_t_2016, dat_t_2015, dat_t_2014, dat_t_2013, dat_t_2012, dat_t_2011, dat_t_2010, dat_t_2009, dat_t_2008, dat_t_2007, dat_t_2006, dat_t_2005, dat_t_2004, dat_t_2003, dat_t_2002, dat_t_2001, dat_t_2000, dat_t_1999, dat_t_1998)

str(team_prizes)

#data events =================================
url <- read_html("https://www.esportsearnings.com/history/2018/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2018 <- data.frame(name, nmbs2)
colnames(dat_e_2018) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2018["Year"] <- NA
dat_e_2018$Year <- 2018
dat_e_2018$Date <- NULL 
head(dat_e_2018)

url <- read_html("https://www.esportsearnings.com/history/2017/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2017 <- data.frame(name, nmbs2)
colnames(dat_e_2017) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2017["Year"] <- NA
dat_e_2017$Year <- 2017
dat_e_2017$Date <- NULL 
head(dat_e_2017)

url <- read_html("https://www.esportsearnings.com/history/2016/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2016 <- data.frame(name, nmbs2)
colnames(dat_e_2016) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2016["Year"] <- NA
dat_e_2016$Year <- 2016
dat_e_2016$Date <- NULL 
head(dat_e_2016)

url <- read_html("https://www.esportsearnings.com/history/2015/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2015 <- data.frame(name, nmbs2)
colnames(dat_e_2015) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2015["Year"] <- NA
dat_e_2015$Year <- 2015
dat_e_2015$Date <- NULL 
head(dat_e_2015)

url <- read_html("https://www.esportsearnings.com/history/2014/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2014 <- data.frame(name, nmbs2)
colnames(dat_e_2014) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2014["Year"] <- NA
dat_e_2014$Year <- 2014
dat_e_2014$Date <- NULL 
head(dat_e_2014)

url <- read_html("https://www.esportsearnings.com/history/2013/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2013 <- data.frame(name, nmbs2)
colnames(dat_e_2013) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2013["Year"] <- NA
dat_e_2013$Year <- 2013
dat_e_2013$Date <- NULL 
head(dat_e_2013)

url <- read_html("https://www.esportsearnings.com/history/2012/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2012 <- data.frame(name, nmbs2)
colnames(dat_e_2012) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2012["Year"] <- NA
dat_e_2012$Year <- 2012
dat_e_2012$Date <- NULL 
head(dat_e_2012)

url <- read_html("https://www.esportsearnings.com/history/2011/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2011 <- data.frame(name, nmbs2)
colnames(dat_e_2011) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2011["Year"] <- NA
dat_e_2011$Year <- 2018
dat_e_2011$Date <- NULL 
head(dat_e_2011)

url <- read_html("https://www.esportsearnings.com/history/2010/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2010 <- data.frame(name, nmbs2)
colnames(dat_e_2010) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2010["Year"] <- NA
dat_e_2010$Year <- 2010
dat_e_2010$Date <- NULL 
head(dat_e_2010)

url <- read_html("https://www.esportsearnings.com/history/2009/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2009 <- data.frame(name, nmbs2)
colnames(dat_e_2009) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2009["Year"] <- NA
dat_e_2009$Year <- 2009
dat_e_2009$Date <- NULL 
head(dat_e_2009)

url <- read_html("https://www.esportsearnings.com/history/2008/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2008 <- data.frame(name, nmbs2)
colnames(dat_e_2008) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2008["Year"] <- NA
dat_e_2008$Year <- 2008
dat_e_2008$Date <- NULL 
head(dat_e_2008)

url <- read_html("https://www.esportsearnings.com/history/2007/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2007 <- data.frame(name, nmbs2)
colnames(dat_e_2007) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2007["Year"] <- NA
dat_e_2007$Year <- 2007
dat_e_2007$Date <- NULL 
head(dat_e_2007)

url <- read_html("https://www.esportsearnings.com/history/2006/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2006 <- data.frame(name, nmbs2)
colnames(dat_e_2006) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2006["Year"] <- NA
dat_e_2006$Year <- 2006
dat_e_2006$Date <- NULL 
head(dat_e_2006)

url <- read_html("https://www.esportsearnings.com/history/2005/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2005 <- data.frame(name, nmbs2)
colnames(dat_e_2005) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2005["Year"] <- NA
dat_e_2005$Year <- 2005
dat_e_2005$Date <- NULL 
head(dat_e_2005)

url <- read_html("https://www.esportsearnings.com/history/2004/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2004 <- data.frame(name, nmbs2)
colnames(dat_e_2004) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2004["Year"] <- NA
dat_e_2004$Year <- 2004
dat_e_2004$Date <- NULL 
head(dat_e_2004)

url <- read_html("https://www.esportsearnings.com/history/2003/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2003 <- data.frame(name, nmbs2)
colnames(dat_e_2003) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2003["Year"] <- NA
dat_e_2003$Year <- 2003
dat_e_2003$Date <- NULL 
head(dat_e_2003)

url <- read_html("https://www.esportsearnings.com/history/2002/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2002 <- data.frame(name, nmbs2)
colnames(dat_e_2002) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2002["Year"] <- NA
dat_e_2002$Year <- 2002
dat_e_2002$Date <- NULL 
head(dat_e_2002)

url <- read_html("https://www.esportsearnings.com/history/2001/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2001 <- data.frame(name, nmbs2)
colnames(dat_e_2001) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2001["Year"] <- NA
dat_e_2001$Year <- 2001
dat_e_2001$Date <- NULL 
head(dat_e_2001)

url <- read_html("https://www.esportsearnings.com/history/2000/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_2000 <- data.frame(name, nmbs2)
colnames(dat_e_2009) <- c("Event Name", "Date", "Prize Money in $")
dat_e_2000["Year"] <- NA
dat_e_2000$Year <- 2000
dat_e_2000$Date <- NULL 
head(dat_e_2000)

url <- read_html("https://www.esportsearnings.com/history/1999/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_1999 <- data.frame(name, nmbs2)
colnames(dat_e_1999) <- c("Event Name", "Date", "Prize Money in $")
dat_e_1999["Year"] <- NA
dat_e_1999$Year <- 1999
dat_e_1999$Date <- NULL 
head(dat_e_1999)

url <- read_html("https://www.esportsearnings.com/history/1998/list_events")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_date", " " ))]')

nmbs <- html_text(nds)
head(nmbs) 

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789.]", "", nmbs), ncol = 2, byrow = T)
class(value) <- "numeric"
head(nmbs2)

nds2 <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_event", " " ))]')
name <- html_text(nds2)
head(name)

name <- matrix(as.character(name), ncol = 1, byrow = T)
head(name)

dat_e_1998 <- data.frame(name, nmbs2)
colnames(dat_e_1998) <- c("Event Name", "Date", "Prize Money in $")
dat_e_1998["Year"] <- NA
dat_e_1998$Year <- 1998
dat_e_1998$Date <- NULL 
head(dat_e_1998)


# team_prizes["ID"] <- NA
# team_prizes$ID <- 1:2001
# str(team_prizes)


#   
# # #API tryout
# #high_earn <- fromJSON('https://api.esportsearnings.com/v0/LookupHighestEarningPlayers?apikey=27a22c5b980f900cb6d5b7d0c3d9d548daba6a57abdec2d115919ef8b01745bd&format=json')
# # 
# #head(high_earn)
