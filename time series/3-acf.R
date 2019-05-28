par(mfrow = c(3,1))
acf(arima.sim(n=100, list(ar=c(0.3,-0.2))), main="AR(2)")
acf(arima.sim(n=100, list(ma=-0.5)), main="MA(1)")
acf(arima.sim(n=100, list(ar=c(0.3,-0.2),ma=-0.5)), main="ARMA(2,1)")