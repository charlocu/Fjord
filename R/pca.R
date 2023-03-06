dist_populations<-read.table("dataForPCA.mdist",header=F)
### Extract breed names
fam <- data.frame(famids=read.table("dataForPCA.mdist.id")[,1])
### Extract individual names 
famInd <- data.frame(IID=read.table("dataForPCA.mdist.id")[,2])

## Perform PCA using the cmdscale function 
# Time intensive step - takes a few minutes with the 4.5K animals
mds_populations <- cmdscale(dist_populations,eig=T,5)

## Extract the eigen vectors
eigenvec_populations <- cbind(fam,famInd,mds_populations$points)

## Proportion of variation captured by each eigen vector
eigen_percent <- round(((mds_populations$eig)/sum(mds_populations$eig))*100,2)

#adding colnames to phenotype excel
pheno<-X211018_phenotypes_colour
names<-c('fam', 'id', 'ub', 'gub', 'rb', 'gb', 'st', 'ha' )
colnames(pheno)<-names
eigenvec_populations<-cbind(eigenvec_populations, pheno)


#visualisation############
ggplot(data = eigenvec_populations) +
  geom_point(mapping = aes(x = `1`, y = `2`,color = rb), show.legend = FALSE ) + 
  geom_hline(yintercept = 0, linetype="dotted") + 
  geom_vline(xintercept = 0, linetype="dotted") +
  labs(title = "PCA of fjording pop",
       x = paste0("Principal component 1 (",eigen_percent[1]," %)"),
       y = paste0("Principal component 2 (",eigen_percent[2]," %)")) + 
  theme_minimal()
