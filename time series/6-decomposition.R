co2<-datasets::co2
y<-ts(co2, start = 1975, frequency = 12)
par(mfrow=c(4,1))
y<-decompose(y)
plot(y)