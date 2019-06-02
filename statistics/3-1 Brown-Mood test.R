# Brown-Mood test
# to judge the quality of q-quantiles of two list of data

BMq.test = function(x,y,q,alt){
  xy=c(x,y)
  quantil1e.xy=quantile(xy,q)
  t=sum(xy>quantil1e.xy)
  lx=length(x[x!=quantil1e.xy])
  ly=length(y[y!=quantil1e.xy])
  lxy=lx+ly
  A=sum(x>quantil1e.xy)
  z=(A-lx*t)/(lxy)/(lx*ly*t*(lxy-t)/(lxy)^3)^0.5
  
  if(A>min(lx,t)/2)
    z1=(A+0.5-lx*t)/(lxy)/(lx*ly*t*(lxy-t)/(lxy)^3)^0.5
  else
    z1=(A-0.5-lx*t)/(lxy)/(lx*ly*t*(lxy-t)/(lxy)^3)^0.5
  
  if(alt=="greater"){
    pv1=1-phyper(A,lx,ly,t)
    pv2=1-pnorm(z)
    pv3=1-pnorm(z1)
  }
  if(alt=="less"){
    pv1=phyper(A,lx,ly,t)
    pv2=pnorm(z)
    pv3=pnorm(z1)
  }
  if(alt=="two.sided"){
    pv1=2*min(phyper(A,lx,ly,t),1-phyper(A,lx,ly,t))
    pv2=2*min(pnorm(z),1-pnorm(z))
    pv3=2*min(pnorm(z1),1-pnorm(z1))
  }
  conting.table=matrix(c(A,lx-A,lx,t-A,ly-(t-A),ly,t,lxy-t,lxy),3,3)
  col.name=c("X","Y","X+Y")
  row.name=c(">MQXY","<MQXY","TOTAL")
  dimnames(conting.table)=list(row.name,col.name)
  list(continggency.table=conting.table,p.value=pv1,pvnorm=pv2,pvnr=pv3)
}


a=c(698,688,675,656,655,648,640,639,620)
b=c(780,754,740,712,693,680,621)
x=BMq.test(a,b,0.75,"two.sided")
print(x$continggency.table)
print(x$p.value)
print(x$pvnorm)
print(x$pvnr)

plot(density(a),main = "Kernel Density", lwd=2, xlim=c(450,900))
lines(density(b), lwd=2, lty=2)
legend("topright", legend = c("a","b"), lty=c(1,2), lwd=c(2,2))