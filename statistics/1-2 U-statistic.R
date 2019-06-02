# is t-distribution symmetrical?
# using U-statistic to judge
#
# P(X1>(X2+X3)/2) = 1/2



U_statistic<-function(df, n){
  USTAT<-NULL
  for(mu in 1:n){
    x<-rt(20,df)
    len<-length(x)
    H<-NULL
    for(i in 1:(len-2))
      for(j in (i+1):(len-1))
        for(k in (j+1):len){
          a1<-sign(2*x[i]-x[j]-x[k])
          a2<-sign(2*x[j]-x[k]-x[i])
          a3<-sign(2*x[k]-x[j]-x[i])
          h<-1/3*(a1+a2+a3)
          H=c(H,h)
        }
    Ustat<-(1/choose(len,3))*sum(H)
    USTAT<-c(USTAT,Ustat)
  }
  hist(USTAT,border = F, col = "grey")
  list(Umean = mean(USTAT), Uvar=var(USTAT))
}

m<-U_statistic(3,300)
m$Umean
m$Uvar