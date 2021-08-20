x1 <- readLines("/home/amesclir/Downloads/sequence.txt")
important_line1 <- x1[grepl('^>', x1)]
important_line1
strsplit(important_line1, "..", fixed = TRUE)
sub1 <-sapply(strsplit(important_line1,"..", fixed = T),function(x) x[1])
sub1 <- sub(".*location=", "", sub1)  
sub1 <- sub(".*complement", "", sub1) 
#sub1 <- sub(".*join", "", sub1)
sub1 <- sub("[(]", "", sub1)
sub1
sub2 <-sapply(strsplit(important_line1,"..", fixed = T),function(x) x[2])
sub2 <- sub("].*", "", sub2)   
sub2  <- sub(").*", "", sub2)
#sub2  <- sub(",.*", "", sub2)
sub2

genes1 <- cbind (rep("chr1", length(sub1)), sub1, sub2)
colnames(genes1) <- c("Chromosome", "Start", "End")
genes1

genes2 <- cbind (rep("chr2", length(sub1)), sub1, sub2)
colnames(genes2) <- c("Chromosome", "Start", "End")
genes2

genes3 <- cbind (rep("chr3", length(sub1)), sub1, sub2)
colnames(genes3) <- c("Chromosome", "Start", "End")
genes3

genes4 <- cbind (rep("chr4", length(sub1)), sub1, sub2)
colnames(genes4) <- c("Chromosome", "Start", "End")
genes4

genes5 <- cbind (rep("chr5", length(sub1)), sub1, sub2)
colnames(genes5) <- c("Chromosome", "Start", "End")
genes5

genes6 <- cbind (rep("chr6", length(sub1)), sub1, sub2)
colnames(genes6) <- c("Chromosome", "Start", "End")
genes6

genes7 <- cbind (rep("chr7", length(sub1)), sub1, sub2)
colnames(genes7) <- c("Chromosome", "Start", "End")
genes7

genes8 <- cbind (rep("chr8", length(sub1)), sub1, sub2)
colnames(genes8) <- c("Chromosome", "Start", "End")
genes8

genes9 <- cbind (rep("chr9", length(sub1)), sub1, sub2)
colnames(genes9) <- c("Chromosome", "Start", "End")
genes9

genes10 <- cbind (rep("chr10", length(sub1)), sub1, sub2)
colnames(genes10) <- c("Chromosome", "Start", "End")
genes10

genes11 <- cbind (rep("chr11", length(sub1)), sub1, sub2)
colnames(genes11) <- c("Chromosome", "Start", "End")
genes11

genes12 <- cbind (rep("chr12", length(sub1)), sub1, sub2)
colnames(genes12) <- c("Chromosome", "Start", "End")
genes12

genes13 <- cbind (rep("chr13", length(sub1)), sub1, sub2)
colnames(genes13) <- c("Chromosome", "Start", "End")
genes13

genes14 <- cbind (rep("chr14", length(sub1)), sub1, sub2)
colnames(genes14) <- c("Chromosome", "Start", "End")
genes14

genes15 <- cbind (rep("chr15", length(sub1)), sub1, sub2)
colnames(genes15) <- c("Chromosome", "Start", "End")
genes15

genes16 <- cbind (rep("chr16", length(sub1)), sub1, sub2)
colnames(genes16) <- c("Chromosome", "Start", "End")
genes16

genes17 <- cbind (rep("chr17", length(sub1)), sub1, sub2)
colnames(genes17) <- c("Chromosome", "Start", "End")
genes17

genes18 <- cbind (rep("chr18", length(sub1)), sub1, sub2)
colnames(genes18) <- c("Chromosome", "Start", "End")
genes18

genes19 <- cbind (rep("chr19", length(sub1)), sub1, sub2)
colnames(genes19) <- c("Chromosome", "Start", "End")
genes19

genes20 <- cbind (rep("chr20", length(sub1)), sub1, sub2)
colnames(genes20) <- c("Chromosome", "Start", "End")
genes20

genes21 <- cbind (rep("chr21", length(sub1)), sub1, sub2)
colnames(genes21) <- c("Chromosome", "Start", "End")
genes21

genes22 <- cbind (rep("chr22", length(sub1)), sub1, sub2)
colnames(genes22) <- c("Chromosome", "Start", "End")
genes22

genes23 <- cbind (rep("chr23", length(sub1)), sub1, sub2)
colnames(genes23) <- c("Chromosome", "Start", "End")
genes23

genes24 <- cbind (rep("chr24", length(sub1)), sub1, sub2)
colnames(genes24) <- c("Chromosome", "Start", "End")
genes24

genes25 <- cbind (rep("chr25", length(sub1)), sub1, sub2)
colnames(genes25) <- c("Chromosome", "Start", "End")
genes25

genes26 <- cbind (rep("chr26", length(sub1)), sub1, sub2)
colnames(genes26) <- c("Chromosome", "Start", "End")
genes26

genes27 <- cbind (rep("chr27", length(sub1)), sub1, sub2)
colnames(genes27) <- c("Chromosome", "Start", "End")
genes27

genes28 <- cbind (rep("chr28", length(sub1)), sub1, sub2)
colnames(genes28) <- c("Chromosome", "Start", "End")
genes28

genes29 <- cbind (rep("chr29", length(sub1)), sub1, sub2)
colnames(genes29) <- c("Chromosome", "Start", "End")
genes29

genes <- rbind(genes1, genes2, genes3, genes4, genes5, genes6, genes7, genes8, genes9, genes10, genes11 , genes12, genes13, genes14, genes15, genes16, genes17, genes18, genes19, genes20, genes21, genes22, genes23, genes24, genes25, genes26, genes27, genes28, genes29)
write.csv(genes, file = "genes.csv")

