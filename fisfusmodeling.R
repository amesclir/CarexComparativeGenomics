fisfusmodelling <- function(genome, rearrangements, pfis) {

pfus = 1 - pfis      

genomes <- list()
genomes[[1]] <- genome

for (i in 1:rearrangements) {

event <- sample(c(0,1), size = 1, replace = FALSE, prob = c(pfis, pfus))

if (event == 0) {
probchrom <-vector()
for (j in 1:length(unique(genome[,1]))) {

probchrom[j] <- max(as.numeric(genome[genome[,1] == unique(genome[,1])[j],2]))
}
probchrom / sum(probchrom)

fissionLG <- sample(unique(genome[,1]), size = 1, replace = FALSE, prob = probchrom)  
#print(fissionLG)  
fissionpoint <- sample(2:(max(as.numeric(genome[genome[,1] == fissionLG,2]))-1), size = 1, replace = FALSE)
#print(fissionpoint)

if ((dim(genome[genome[,1] == fissionLG,])[1]) > 1) {

for(k in 1:((dim(genome[genome[,1] == fissionLG,])[1])-1)) {
  x = as.numeric(genome[genome[,1] == fissionLG,][k,2]) < fissionpoint & as.numeric(genome[genome[,1] == fissionLG,][k+1,2]) > fissionpoint
  if(is.na(x)) {
    next
    } 
  else { 
  if (as.numeric(genome[genome[,1] == fissionLG,][k,2]) < fissionpoint & as.numeric(genome[genome[,1] == fissionLG,][k+1,2]) > fissionpoint) {
  newrow <- c(fissionLG,fissionpoint,NA,NA)
  subLGa <- genome[genome[,1] == fissionLG &  as.numeric(genome[,2]) < fissionpoint,]
  subLGa[,1] <- paste(subLGa[,1],"a",sep="")
  subLGb <- rbind(newrow,genome[genome[,1] == fissionLG &  as.numeric(genome[,2]) > fissionpoint,])
  subLGb[,1] <- paste(subLGb[,1],"b",sep="")
  subLGb[,2] <- as.numeric(subLGb[,2]) - as.numeric(subLGb[1,2]) + 1
  subgenome <- rbind(subLGa,subLGb)
  genome <- rbind(genome[genome[,1] != fissionLG,],subgenome)
}  
}
}
}
}
else
{
  probchrom <-vector()
  for (j in 1:length(unique(genome[,1]))) {
    
    probchrom[j] <- max(as.numeric(genome[genome[,1] == unique(genome[,1])[j],2]))
  }
  probchrom / sum(probchrom)
  
  if (length(unique(genome[,1])) >1){
  fusionLG <- sample(unique(genome[,1]), size = 2, replace = FALSE, prob = probchrom)  
  subgenome <- rbind(genome[genome[,1]==fusionLG[1],],genome[genome[,1]==fusionLG[2],])
  subgenome[subgenome[,1]==unique(subgenome[,1])[2],2] <- as.numeric(subgenome[subgenome[,1]==unique(subgenome[,1])[2],2]) + max(as.numeric(subgenome[subgenome[,1]==unique(subgenome[,1])[1],2])) + 100
  #subgenome[,1] <- paste(unique(subgenome[,1])[1], unique(subgenome[,1])[2], sep="")
  subgenome[,1] <- unique(subgenome[,1])[1]
  genome <- rbind(genome[genome[,1] != fusionLG[1] & genome[,1] != fusionLG[2],],subgenome)
}  
}
genomes[[i+1]] <- genome
}
genomes
}

