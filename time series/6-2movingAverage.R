library(TTR)
co2<-datasets::co2
y<-ts(co2, start = 1975, end = 1988, frequency = 12)
simpleMA<-SMA(y, n=5)
centralMA<-filter(y,filter = c(1/4,1/2,1/4), sides = 2)
squareMA<-filter(y,filter = rep(1/2,2), sides = 1)

plot(y)
lines(simpleMA,col=2)
lines(centralMA,col=3)
lines(squareMA,col=2)