par(mfrow = c(3,1))
plot(arima.sim(n=100, list(ar=0.3)), main="AR(1)")
plot(arima.sim(n=100, list(ma=-0.5)), main="MA(1)")
plot(arima.sim(n=100, list(ar=0.3,ma=-0.5)), main="ARMA(1,1)")