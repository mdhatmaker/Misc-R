setwd("/Users/michael/Downloads")

install.packages('quantmod')
library('quantmod')
getSymbols("AAPL")
barChart(AAPL)

##-----just last couple of weeks-----
barChart(AAPL, subset='last 14 days')
chartSeries(AAPL, subset='last 14 days')

##-----grab a particular date range-----
barChart(AAPL['2013-04-01::2013-04-12'])

##-----twitteR (analyze Twitter data)
##-----Quandl and rdatamarket (millions of data sets)
##-----rga, RGoogleAnalytics, ganalytics (Google Analytics)

##-----save/load an individual R object:
firstName<-"Michael"
save(firstName, file="filename.rda")
load("filename.rda")

##-----feather and fst packages for speedier saving and loading
##-----feather can also read/write to Python
##-----fst is very fast AND offers compression

mydata<-read.csv("/Users/michael/Dropbox/alvin/data/DF_DATA/1coinUSD.DF.csv")
objectStructure = str(mydata)
colnames(mydata)
summary(mydata)

library("psych")
describe(mydata)

##correlation of each column vs each other column
##cor(mydata)


