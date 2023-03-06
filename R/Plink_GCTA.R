#packages#####
pacman::p_load(pacman, rio, dbplyr, tidyverse, ggplot2, lubridate)

import('miss-fjord.xlsx')%>%
  {.->>fjord}

#scratch#########
x<-c('famid','id','sire','dam', 'sex', 'pheno')
colnames(fjording)<-x
length(unique(fjording$sire))
length(unique(fjording$dam))

#creating phenotype file for plink
import('211018_phenotypes_colour.xlsx')%>%
  {.->>pheno_fjord}
names<-c('famID', 'ID','ulsblakk','gulblakk','rødblakk','gråblakk','stjerne','hvite_avtegn')
colnames(pheno_fjord)<-names

#export file w/o headers to make it suitable for a plink phenotype file
export(pheno_fjord, 'pheno_fjord.txt', col.names=F) 

#making the GCTA pheno file
#converting 1->0 and 2->1 for GCTA case/control format
pheno_fjord$ulsblakk[pheno_fjord$ulsblakk==1]<-0
pheno_fjord$ulsblakk[pheno_fjord$ulsblakk==2]<-1
pheno_fjord$gulblakk[pheno_fjord$gulblakk==1]<-0
pheno_fjord$gulblakk[pheno_fjord$gulblakk==2]<-1
pheno_fjord$rødblakk[pheno_fjord$rødblakk==1]<-0
pheno_fjord$rødblakk[pheno_fjord$rødblakk==2]<-1
pheno_fjord$gråblakk[pheno_fjord$gråblakk==1]<-0
pheno_fjord$gråblakk[pheno_fjord$gråblakk==2]<-1
pheno_fjord$stjerne[pheno_fjord$stjerne==1]<-0
pheno_fjord$stjerne[pheno_fjord$stjerne==2]<-1
pheno_fjord$hvite_avtegn[pheno_fjord$hvite_avtegn==1]<-0
pheno_fjord$hvite_avtegn[pheno_fjord$hvite_avtegn==2]<-1

#checking I did it right
unique(pheno_fjord$ulsblakk)
unique(pheno_fjord$gulblakk)
unique(pheno_fjord$rødblakk)
unique(pheno_fjord$gråblakk)
unique(pheno_fjord$stjerne)
unique(pheno_fjord$hvite_avtegn)

export(pheno_fjord, 'fjord_GCTA.txt', col.names=F)

#plot of white markings and base coat colour
pheno_fjord%>%
  filter(hvite_avtegn==2|stjerne==2)%>%
  {.->>hvite}
