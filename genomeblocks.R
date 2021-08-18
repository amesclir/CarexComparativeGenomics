genomeblocks <- function(x) {
  out <- matrix(NA, 1, 4, dimnames = list(NULL, c('lg', 'start', 'end', 'type')))
  out[1,] <- c(x$Chromosome.y[1], x$chromStart[1], NA,NA)
  
  for(i in 1:dim(x)[1]) {
    if(x$Chromosome.y[i] == out[dim(out)[1], 1]) { 
      out[nrow(out),3] <- x$chromStart[i]
    } else 
      out <- rbind(out, c(x$Chromosome.y[i], x$chromStart[i], x$chromStart[i],NA)) 
  }
  
  
  for(i in 1:(dim(out)[1])) {
    if(out[i,"start"] == out[i,"end"] ) { 
      out[i,4] <- "singlemarker" 
    } else 
      out[i,4] <- "conserved"
  }
  
  if ((dim(out)[1]-1) != 0) {
    
    for(i in 1:(dim(out)[1]-1)) {
      
      if(out[i,"type"] == "singlemarker" ) { 
        out[i,3] <- as.numeric(out[i+1,2]) -1
      } else 
        next
    }
    
    for(i in 2:dim(out)[1]) {
      if(out[i,"type"] == "singlemarker" ) { 
        out[i,2] <- as.numeric(out[i-1,3]) +1
      } else 
        next
    }  
    
    
    counter <- vector()
    for(i in 1:(dim(out)[1]-1)) {
      if(out[i,"type"] == "conserved" & out[i+1,"type"] == "conserved") { 
        counter[i] <- 1 
      } else 
        counter[i] <- 0
    }
    
    for(i in 1:((dim(out)[1]-1)+(sum(counter)-1))) {
      if(out[i,"type"] == "conserved" & out[i+1,"type"] == "conserved") { 
        newrow <- c(paste(out[i], "-", out[i+1]), as.numeric(out[i,3]) +1, as.numeric(out[i+1,2]) -1, "fisfus")
        out <- rbind(out[1:i,],newrow,out[(i+1):nrow(out),])
        
      } else 
        next
    }
  }
  return(out)
}
