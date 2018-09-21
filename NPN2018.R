################################
install.packages(c("httr", "jsonlite", "lubridate"))
library(httr)
library(jsonlite)
response <- GET("http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2012-01-01&end_date=2012-01-31&request_src=rest_test")
body <- content(response, "text")  
# extract the body JSON
parsed.data <- fromJSON(body)  # convert the JSON string to a list


#JSON Files:
#getAllObservationsForSpecies
response <- GET("http://www.usanpn.org/npn_portal/observations/getAllObservationsForSpecies.json?species_id[0]=52&species_id[1]=53&start_date=2008-01-01&end_date=2011-12-31")
body <- content(response, "text")  
# extract the body JSON
parsed.data <- fromJSON(body)  # convert the JSON string to a list
names(parsed.data) #station_list # phenophase_list
station <- parsed.data$station_list
phenophase <- parsed.data$phenophase_list
#View(station) 
#View(phenophase)




#XML files:
install.packages("XML")
# Load the package required to read XML files.
library("XML")
# Also load the other required package.
library("methods")
install.packages("plyr")
library(plyr)
require("XML")
library(XML)
library(methods)
########################2018 NPN Data################################
url.18_01 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-01-01&end_date=2018-01-31&request_src=rest_test"
dataset <- xmlParse(url.18_01)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_01 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_01)
url.18_02 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-02-01&end_date=2018-02-28&request_src=rest_test"
dataset <- xmlParse(url.18_02)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_02 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_02)
url.18_03 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-03-01&end_date=2018-03-31&request_src=rest_test"
dataset <- xmlParse(url.18_03)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_03 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_03)
url.18_04 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-04-01&end_date=2018-04-30&request_src=rest_test"
dataset <- xmlParse(url.18_04)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_04 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_04)
url.18_05 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-05-01&end_date=2018-05-31&request_src=rest_test"
dataset <- xmlParse(url.18_05)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_05 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_05)
url.18_06 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-06-01&end_date=2018-06-30&request_src=rest_test"
dataset <- xmlParse(url.18_06)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_06 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_06)
url.18_07 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-07-01&end_date=2018-07-31&request_src=rest_test"
dataset <- xmlParse(url.18_07)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_07 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_07)
url.18_08 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-08-01&end_date=2018-08-31&request_src=rest_test"
dataset <- xmlParse(url.18_08)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_08 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_08)
url.18_09 <- "http://www.usanpn.org/npn_portal/observations/getSummarizedData.xml?start_date=2018-09-01&end_date=2018-09-30&request_src=rest_test"
dataset <- xmlParse(url.18_09)
data <- xmlToDataFrame(nodes = getNodeSet(dataset,"//observations"))
xml.data.18_09 <- ldply(xmlToList(dataset,data.frame()))
#View(xml.data.18_09)
data.2018 <- rbind.data.frame(xml.data.18_01,xml.data.18_02,xml.data.18_03,xml.data.18_04,xml.data.18_05,xml.data.18_06,
                              xml.data.18_07,xml.data.18_08,xml.data.18_09)
data.animal <- data.2018[data.2018$kingdom=="Animalia",]
data.plant <- data.2018[data.2018$kingdom=="Plantae",]
write.csv(data.animal,"Animal2018.csv")
write.csv(data.plant,"Plant2018.csv")