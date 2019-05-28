white_noise <- rnorm(500)
white_noise <- ts(white_noise)
par(mfrow=c(1,2))
plot(white_noise, main = " ")
acf(white_noise, main = " ")

Box.test(white_noise, lag = 6)