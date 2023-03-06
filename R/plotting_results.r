library(tidyverse)
###Allele Frequencies-25mbp positions first######
#####first frequency diffs for chr23, 25-32mbp#######
controls<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq25_chr23_controls.frq', sep='\t', header=T, row.names= NULL)
colnames(controls)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(controls)<-names
controls<-controls[,1:5]
controls$Allele_co<-substr(controls$`Allele;Freq`, 1,1)
controls$Freq_co<-substr(controls$`Allele;Freq`,3,8)
controls<-controls[,c(1:4,6,7)]

#repeat this process for the controls
cases<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq25_chr23_cases.frq', sep='\t', header=T, row.names= NULL)
colnames(cases)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(cases)<-names
cases<-cases[,1:5]
cases$Allele_ca<-substr(cases$`Allele;Freq`, 1,1)
cases$Freq_ca<-substr(cases$`Allele;Freq`,3,8)
cases<-cases[,c(1:4,6,7)]

#plotting the SNPs missing from the controls that are in the cases
samesnps<-semi_join(controls, cases) #takes the rows in x with a match in y
samesnpsW<-left_join(samesnps,cases) #taking the common rows and adding the values from y, i guess i didnt need semi_join
samesnpsW$Freq_ca<-as.numeric(samesnpsW$Freq_ca)
samesnpsW$Freq_co<-as.numeric(samesnpsW$Freq_co)
samesnpsW$diff<-abs(samesnpsW$Freq_ca-samesnpsW$Freq_co)

#small aside for Dag Inge
samesnpsW%>%
  filter(diff>0.7)%>%
  {.->>top_snps25}
samesnpsW%>%
  filter(diff>0.45)%>%
  {.->>top_snps47}
install.packages('rio')
library('rio')
top_snps<-rbind(top_snps25,top_snps47)
export(top_snps, file='/net/cn-1/mnt/SCRATCH/charlocu/top_snps.tsv' )
#looking at the SNPs that are in the controls files vs the cases
missing_ca<-anti_join(controls, cases)
ggplot(missing_ca, mapping=aes(Position, Freq_co))+
  geom_point(mapping=aes())+
  labs(y='Frequency')

#now looking at the SNPs in the cases that are not in the controls
missing_co<-anti_join(cases, controls)
ggplot(missing_ca, mapping=aes(Position, Freq_co))+
  geom_point(mapping=aes())+
  labs(y='Frequency')

#time to plot
ggplot(samesnpsW,mapping=aes(Position,diff))+
  geom_point(mapping=aes())+
  labs(title='Absolute difference in AF',
       subtitle='Between cases and controls on chr 23 between 25-32mbp',
       x='Position (bp)', y='Difference in frequency')

#####repeating for 47mbp positions#######
##first frequency diffs for chr23, 47-52mbp########
controls2<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq47_chr23_controls.frq', sep='\t', header=T, row.names= NULL)
colnames(controls2)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(controls2)<-names
controls2<-controls2[,1:5]
controls2$Allele_co<-substr(controls2$`Allele;Freq`, 1,1)
controls2$Freq_co<-substr(controls2$`Allele;Freq`,3,8)
controls2<-controls2[,c(1:4,6,7)]

#repeat this process for the controls
cases2<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq47_chr23_cases.frq', sep='\t', header=T, row.names= NULL)
colnames(cases2)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(cases2)<-names
cases2<-cases2[,1:5]
cases2$Allele_ca<-substr(cases2$`Allele;Freq`, 1,1)
cases2$Freq_ca<-substr(cases2$`Allele;Freq`,3,8)
cases2<-cases2[,c(1:4,6,7)]

#plotting the SNPs missing from the controls that are in the cases
samesnps2<-semi_join(cases2, controls2)
samesnpsW<-left_join(samesnps2,controls2)
samesnpsW$Freq_ca<-as.numeric(samesnpsW$Freq_ca)
samesnpsW$Freq_co<-as.numeric(samesnpsW$Freq_co)
samesnpsW$diff<-abs(samesnpsW$Freq_ca-samesnpsW$Freq_co)

#looking at the SNPs that are in the cases files vs the controls
missing_ca<-anti_join( controls2, cases2)
ggplot(missing_ca, mapping=aes(Position, Freq_co))+
  geom_point(mapping=aes())+
  labs(y='Frequency')

#time to plot
ggplot(samesnpsW,mapping=aes(Position,diff))+
  geom_point(mapping=aes())+
  labs(title='Absolute difference in AF',
       subtitle='Between cases and controls on chr 23 between 47-52mbp',
       x='Position (bp)', y='Difference in frequency')

####other chromosomes#########
#chr 3 first######
controls3<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq_chr3_controls.frq', sep='\t', header=T, row.names= NULL)
colnames(controls3)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(controls3)<-names
controls3<-controls3[,1:5]
controls3$Allele_co<-substr(controls3$`Allele;Freq`, 1,1)
controls3$Freq_co<-substr(controls3$`Allele;Freq`,3,8)
controls3<-controls3[,c(1:4,6,7)]

#repeat this process for the controls
cases3<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq_chr3_cases.frq', sep='\t', header=T, row.names= NULL)
colnames(cases3)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(cases3)<-names
cases3<-cases3[,1:5]
cases3$Allele_ca<-substr(cases3$`Allele;Freq`, 1,1)
cases3$Freq_ca<-substr(cases3$`Allele;Freq`,3,8)
cases3<-cases3[,c(1:4,6,7)]

#combining the SNPs from the controls that are in the cases too 
samesnps3<-semi_join(controls3, cases3)
samesnpsW<-left_join(samesnps3,cases3)
samesnpsW$Freq_ca<-as.numeric(samesnpsW$Freq_ca)
samesnpsW$Freq_co<-as.numeric(samesnpsW$Freq_co)
samesnpsW$diff<-abs(samesnpsW$Freq_ca-samesnpsW$Freq_co)

#just curiosity here 
samesnpsW%>%
  filter(diff>0.4)%>%
  view()

#looking at the SNPs that are in the cases files vs the controls
missing_ca<-anti_join( controls3, cases3)
ggplot(missing_ca, mapping=aes(Position, Freq_co))+
  geom_point(mapping=aes())+
  labs(y='Frequency')

#time to plot
ggplot(samesnpsW,mapping=aes(Position,diff))+
  geom_point(mapping=aes())+
  labs(title='Absolute difference in AF around KIT gene locus',
       subtitle='Between cases and controls on chr 3',
       x='Position (bp)', y='Difference in frequency')


##chr 6 next- PAX3#####
controls6<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq_chr6_controls.frq', sep='\t', header=T, row.names= NULL)
colnames(controls6)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(controls6)<-names
controls6<-controls6[,1:5]
controls6$Allele_co<-substr(controls6$`Allele;Freq`, 1,1)
controls6$Freq_co<-substr(controls6$`Allele;Freq`,3,8)
controls6<-controls6[,c(1:4,6,7)]

#repeat this process for the controls
cases6<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq_chr6_cases.frq', sep='\t', header=T, row.names= NULL)
colnames(cases6)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(cases6)<-names
cases6<-cases6[,1:5]
cases6$Allele_ca<-substr(cases6$`Allele;Freq`, 1,1)
cases6$Freq_ca<-substr(cases6$`Allele;Freq`,3,8)
cases6<-cases6[,c(1:4,6,7)]

#combining the SNPs from the controls that are in the cases too 
samesnps6<-semi_join(controls6, cases6)
samesnpsW<-left_join(samesnps6,cases6)
samesnpsW$Freq_ca<-as.numeric(samesnpsW$Freq_ca)
samesnpsW$Freq_co<-as.numeric(samesnpsW$Freq_co)
samesnpsW$diff<-abs(samesnpsW$Freq_ca-samesnpsW$Freq_co)

#looking at the SNPs that are in the cases files vs the controls
missing_ca<-anti_join( controls6, cases6)
ggplot(missing_ca, mapping=aes(Position, Freq_co))+
  geom_point(mapping=aes())+
  labs(y='Frequency')

#time to plot
ggplot(samesnpsW,mapping=aes(Position,diff))+
  geom_point(mapping=aes())+
  labs(title='Absolute difference in AF around PAX3 gene locus',
       subtitle='Between cases and controls on chr 6',
       x='Position (bp)', y='Difference in frequency')

###now finally AF for MITF#######
controls16<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq_chr16_controls.frq', sep='\t', header=T, row.names= NULL)
colnames(controls16)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(controls16)<-names
controls16<-controls16[,1:5]
controls16$Allele_co<-substr(controls16$`Allele;Freq`, 1,1)
controls16$Freq_co<-substr(controls16$`Allele;Freq`,3,8)
controls16<-controls16[,c(1:4,6,7)]

#repeat this process for the controls
cases16<-read.delim(file='/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/freq_chr16_cases.frq', sep='\t', header=T, row.names= NULL)
colnames(cases16)
names<-c('Chr','Position','N_alleles','N_chr','Allele;Freq','Allele2;Freq2')
colnames(cases16)<-names
cases16<-cases16[,1:5]
cases16$Allele_ca<-substr(cases16$`Allele;Freq`, 1,1)
cases16$Freq_ca<-substr(cases16$`Allele;Freq`,3,8)
cases16<-cases16[,c(1:4,6,7)]

#combining the SNPs from the controls that are in the cases too 
samesnps16<-semi_join(controls16, cases16)
samesnpsW<-left_join(samesnps16,cases16)
samesnpsW$Freq_ca<-as.numeric(samesnpsW$Freq_ca)
samesnpsW$Freq_co<-as.numeric(samesnpsW$Freq_co)
samesnpsW$diff<-abs(samesnpsW$Freq_ca-samesnpsW$Freq_co)

#time to plot
ggplot(samesnpsW,mapping=aes(Position,diff))+
  geom_point(mapping=aes())+
  labs(title='Absolute difference in AF around MITF gene locus',
       subtitle='Between cases and controls on chr 16',
       x='Position (bp)', y='Difference in frequency')

####plotting depth ######
depth<-read.delim('/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/depth25_cases.ldepth.mean', sep='\t', header = T, row.names = NULL)
ggplot(depth, mapping=aes(x=POS, y=MEAN_DEPTH))+
  geom_line()+
  geom_smooth()
depth_controls<-read.delim('/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/depth25_controls.ldepth.mean', sep='\t', header = T, row.names = NULL)
ggplot(depth_controls, mapping=aes(x=POS, y=MEAN_DEPTH))+
  geom_line()+
  geom_smooth()
# i dunno how to get this into the plot I want ughhhhhh



####plotting weir FST####
weir<-read.delim('/net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/weir23.weir.fst', sep='\t', header=T, row.names= NULL)
weir%>%
  filter('POS'> 25000000 & 'POS'<32000000)%>%
  view()
  ggplot(mapping=aes(x='POS', y='WEIR_AND_COCKERHAM_FST'))+
    geom_point(mapping=aes())+
    labs(title="Weir and Cockerham's Fst", subtitle='over chr 23:25-32mbp')

####plotting alignment stats, rm vs unmasked genome
rm<-read.delim('/net/cn-1/mnt/SCRATCH/charlocu/RM/sorted_fh9149.stats', sep=' ', header=F)
flags<-rm[,4:10]
um<-read.delim('/net/cn-1/mnt/SCRATCH/charlocu/Alignment/sorted_fh9149.stats', sep=' ', header=F)
rm<-as.data.frame(rm[,1])
um<-as.data.frame(um[,1])
