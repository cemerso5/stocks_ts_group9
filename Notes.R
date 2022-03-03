library(fpp3)
#Read data
stocks <- read.csv('nyse_stocks.csv')
head(stocks)
#Convert to tsibble()
stocks$date <- as.Date(stocks$date)
stocks <- tsibble(stocks, index = date, key = symbol)

#1 Stock
selected_stock <- 'AAPL'
stocks%>%
  filter(symbol == selected_stock)%>%
  autoplot(open)+
  labs(title = selected_stock)

#Multiple Stock
selected_stock <- c('GOOG', 'AAPL')
stocks%>%
  filter(symbol %in% selected_stock)%>%
  autoplot(open)+
  labs(title = selected_stock)
