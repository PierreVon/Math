library(TTR)
library(forecast)

co2<-datasets::co2
y<-ts(co2, start = 1975, end = 1980, frequency = 12)
e<-HoltWinters(y)
y.forecast<-forecast(y,h=5)


par(mfrow=c(2,1))

plot(e)
plot(y.forecast)
