# positive correction

x<-c(5,6)
A<-c()
B<-c()
C<-c()
for(i in 1:2){
  A[i]=pbinom(x[i],size=10, prob = 0.7)
  B[i]=pnorm(x[i],mean = 10*0.7, sd=sqrt(10*0.7*0.3))
  C[i]=pnorm(x[i],mean = (10*0.7-0.5), sd=sqrt(10*0.7*0.3))
}
result=rbind(A,B,C)
dimnames(result)=list(c("B(10,0.7)","N(7,2.1)","N(6.5,2.1"),c(5,6))
print(result)
