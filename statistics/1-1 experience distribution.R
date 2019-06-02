library(MASS)
data("geyser")

par(mfrow=c(1,2))

# experience distribution
duration<-geyser[,2]
duration.sort<-sort(duration)
duration.rank<-rank(duration.sort)
duration.cdf<-duration.rank/length(duration)
plot(duration.sort, duration.cdf, title("experience distribution"))

# confidence interval
len<-length(duration)
segments(duration.sort[1:(len-1)],duration.cdf[1:(len-1)],
        duration.sort[2:len],duration.cdf[1:(len-1)])
alpha<-0.5
band<-sqrt(1/(2*len))*log(2/alpha)

Lower.95<-duration.cdf-band
Upper.95<-duration.cdf+band
lines(duration.sort, Lower.95, lty=2)
lines(duration.sort,Upper.95, lty=2)

# bandwidth
alpha<-seq(0.01,0.1,by=0.001)
band<-sqrt(1/(2*len))*log(2/alpha)
plot(alpha,band, title("bandwidth of confidence interval"))

