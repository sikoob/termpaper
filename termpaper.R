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

?gtrends

res <- gtrends(c("esports"))
plot(res)

res <- gtrends(c("League of Legends", "Fortnite", "Fifa"))
plot(res)

res <- gtrends(c("League of Legends", "Fortnite", "Fifa"), gprop="youtube")
plot(res)

#getting lists of top players and games/teams

url <- read_html("https://www.esportsearnings.com/history")

nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "content_main", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "highlight", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_prize", " " ))]')

nmbs <- html_text(nds)
head(nmbs)

nmbs <- nmbs[nmbs != "Kein Bild hinterlegt"]
nmbs2 <- matrix(gsub("[^0123456789,]", "", nmbs), ncol = 3, byrow = T)
head(nmbs2)

value <- gsub(",", ".", nmbs2)
value[,3] <- gsub("(\\d.\\d)(\\d.\\d)", "\\1", value[,3])
value[,3] <- gsub("(\\d)\\d", "\\1", value[,3])
class(value) <- "numeric"
head(value)

nds2 <- html_nodes(url, xpath = '//*+[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "detail_list_player", " " ))]//a | //a+//a')

name <- html_text(nds2)
head(name)

dat <- data.frame(name, value)
colnames(dat) <- c("Player ID", "Player Name", "Total Prize Money in 2019", "Overall Prize Money", "Share of 2019's prize money")
dat