library(tidyverse)
theme_set(theme_bw()+ theme(legend.position ='right',
                            legend.title = element_text(size=11), legend.text = element_text(size=11)))

#####importing data + organising data#######
samtools<-read.delim(file='C:/Users/charl/OneDrive/Desktop/working thesis/samtools-flagstat-dp.tsv', header=T, sep='\t')
#columns<-c('sample','total reads','total passed QC','mapped','secondary alignments','duplicates','paired in sequencing','properly paired','self and mate mapped','singletons','mate mapped to different chromosome','mate mapped to different chromosome mq')
columns<-c('sample','total reads','total passed QC','mapped','secondary alignments','duplicates','paired','properly paired','self and mate mapped','singletons','mate mapped to different chromosome','mate mapped to different chromosome mq')
colnames(samtools)<-columns
samtools$sample<-substr(samtools$sample,10,13)
mappings<-samtools[,1:4]
#install.packages('reshape2')
#library(reshape2)

######plotting alignment metrics#######
mappingsL<-melt(mappings, id.vars='sample')
ggplot(mappingsL,mapping=aes(x=sample,y=value))+
  geom_point(mapping=aes(colour=variable))+
  labs(title='Alignment metrics', y='Reads in millions')+
  theme(legend.position="bottom")
#####plotting paired########
pairs<-samtools[,c(1,7,8,9)]
pairsL<-melt(pairs, id.vars='sample', variable.name='metric')
ggplot(pairsL, mapping=aes(x=sample, y=value))+
  geom_point(mapping=aes(colour=metric))+ 
  theme(legend.position="bottom")+
  labs(title= 'Alignment metrics', subtitle='Paired sample metrics', y='Reads in millions', x='Sample')

###plotting BQSR sensibly###########
bqsr<-read_tsv(file='gatk-base-recalibrator-quality-scores-plot.tsv')
bqsr_after<-bqsr[,c(1,3,5,7,9,11,13,15,17,19,21,23,25,27,29)]
bqsr_before<-bqsr[,c(1,2,4,6,8,10,12,14,16,18,20,22,24,26,28)]
#once separated, get average, min and max for each row then recombine and plot!
bqsr