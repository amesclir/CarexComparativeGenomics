genomeblocksGC <- function(x,y) {
  GC <- matrix(NA, dim(x)[1], 1, dimnames = list(NULL, c('GC')))
  out <- cbind(x,GC)
  
  for(i in 1:dim(x)[1]) {
    
    for(j in 1:dim(y)[1]) {
      if (as.numeric(x[i,2]) > y[j,1] &  as.numeric(x[i,2]) < y[j,2])  
        
        GCtemp <- c(as.numeric(x[i,2]), y[j,2], y[j,2] - as.numeric(x[i,2]), y[j,4])
    }
    
    if (GCtemp[2] < x[i,3]) { 
      
      
      for(j in 1:dim(y)[1]) {
        if (GCtemp[1] < y[j,1] & as.numeric(x[i,3]) > y[j,2])
          
          GCtemp2 <- rbind(GCtemp, y[j,])
        
      } 
      
      for(j in 1:dim(y)[1]) {  
        if (as.numeric(x[i,3]) > y[j,1] & as.numeric(x[i,3]) < y[j,2])
          newrow <- c(y[j,1], as.numeric(x[i,3]), as.numeric(x[i,3]) - y[j,1], y[j,4])
        GCtemp3 <- rbind(GCtemp2, newrow)
        
      }  
      
    }
    else
    {
      GCtemp3 <- GCtemp
      GCtemp3[2] <- x[i,3]
      GCtemp3[3] <- as.numeric(GCtemp3[2]) - as.numeric(GCtemp3[1])
      GCtemp3<-matrix(GCtemp3,ncol=4)
    }
    
    print(GCtemp3)
    
    out[i,6] <-   sum(as.numeric(GCtemp3[,3]) * as.numeric(GCtemp3[,4])) / sum(as.numeric(GCtemp3[,3]))
    
  }
  
  out
  
}    
