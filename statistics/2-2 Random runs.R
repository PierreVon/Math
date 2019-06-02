druns = function(n, n0, n1){
  b=NULL
  a=1:n
  for(i in 1:n){
    if(a[i]%%2==0){
      k=a[i]/2
      b[i]=2*choose((n1-1),(k-1))*choose((n0-1),(k-1))/choose(n,n1)
    }
    else{
      k=(a[i]-1)/2
      b[i]=(choose((n1-1),(k-1))*choose((n0-1),k)+
              choose((n0-1),(k-1))*choose((n1-1),k))/choose(n,n1)
    }
  }
  c=NULL
  c[1]=b[1]
  for(i in 2:n){
    c[i] = c[(i-1)] + b[i]
  }
  result=as.data.frame(cbind(a,b,c))
  colnames(result)=c("k", "prob", "cumuprob")
  return(result)
}

res=druns(10,4,6)
print(res)
barplot(res$prob)