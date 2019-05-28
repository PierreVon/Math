library("forecast")

t<-arima.sim(n=100, list(ma=0.3))
par(mfrow=c(3,1))

acf(t)
pacf(t)

# residual analysis
fix1<-arima(t, order = c(1,0,0), method = "ML")
Box.test(fix1$residual,lag = 6)

# criterion
fix2<-Arima(t, order = c(1,0,0), method = "ML")
print(fix2$aic)
print(fix2$bic)

# auto fitting
print(auto.arima(t))

# forecasting
tt<-forecast(fix2, h=6)
plot(tt)
print(tt)

