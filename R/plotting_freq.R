###packages#######
library(pacman,tidyverse)
theme_set(theme_bw()+ theme(legend.position ='right',
                            legend.title = element_text(size=11), legend.text = element_text(size=11)))
#####analysis stuff#######
#first is allele frequencies
#first group is the cases###############
library(readxl)
cases25 <- read_excel("analysis/cases25.xlsx")
#install.packages('tidyr')
library(tidyr) 
cases25<-cases25[,1:6]
#split apart info in allele:freq col to plot properly
cases25%>%
  separate(Cases1, into=c('allele1','frequency1'), sep= ':')%>%
  separate(Cases2, into=c('allele2','frequency2'), sep= ':')%>%
  {.->>cases25}

#1=cases allele 1, 2=cases allele 2
cases251<-cases25[,1:6]
#cases252<-cases25[,1:4,7,8]
cases251<-mutate(cases251, version=1)
#cases252<-mutate(cases252, version=2)
names<-c('chr','bp','n_alleles','n_chr','allele','frequency', 'version')
colnames(cases251)<-names
#colnames(cases252)<-names
#cases25_new<-add_row(cases251,cases252)
#ggplot(cases25_new, mapping=aes(bp,frequency))+
 # geom_point(aes(colour=version))

##########now repeat above for the controls####################
controls25 <- read_excel("analysis/controls25.xlsx")
controls25<-controls25[,1:6]
#split apart info in allele:freq col to plot properly
controls25%>%
  separate(Controls1, into=c('allele1','frequency1'), sep= ':')%>%
  separate(Controls2, into=c('allele2','frequency2'), sep= ':')%>%
  {.->>controls25}
#splitting apart the sets
controls251<-controls25[,1:6]
#controls252<-controls25[,c(1:4,7,8)]
#2=controls allele 1, 
controls251<-mutate(controls251, version=2)
#controls252<-mutate(controls252, version=4)
names<-c('chr','bp','n_alleles','n_chr','allele','frequency', 'version')
colnames(controls251)<-names
#colnames(controls252)<-names
#controls25_new<-add_row(controls251,controls252)
#ggplot(controls25_new, mapping=aes(bp,frequency))+
 # geom_point(aes(colour=version))

#now plot for the whole shebang(25) lol #######
complete_25<-add_row(cases251,controls251)
ggplot(complete_25, mapping=aes(bp,frequency))+
  geom_point(aes(colour=version))


####now to do the same for region around 47mbp##########
cases47 <- read_excel("analysis/cases47.xlsx")
cases47<-cases47[,1:6]
#split apart info in allele:freq col to plot properly
cases47%>%
  separate(Cases1, into=c('allele1','frequency1'), sep= ':')%>%
  separate(Cases2, into=c('allele2','frequency2'), sep= ':')%>%
  {.->>cases47}

#1=cases allele 1, 2=cases allele 2
cases471<-cases47[,1:6]
#cases472<-cases47[,c(1:4,7,8)]
cases471<-mutate(cases471, version=1)
#cases472<-mutate(cases472, version=2)
names<-c('chr','bp','n_alleles','n_chr','allele','frequency', 'version')
colnames(cases471)<-names
#colnames(cases472)<-names
#cases47_new<-add_row(cases471,cases472)
#ggplot(cases47_new, mapping=aes(bp,frequency))+
 # geom_point(aes(colour=version))

##########now repeat above for the controls####################
controls47 <- read_excel("analysis/controls47.xlsx")
controls47<-controls47[,1:6]
#split apart info in allele:freq col to plot properly
controls47%>%
  separate(Controls1, into=c('allele1','frequency1'), sep= ':')%>%
  separate(Controls2, into=c('allele2','frequency2'), sep= ':')%>%
  {.->>controls47}
#splitting apart the sets
controls471<-controls47[,1:6]
#controls472<-controls47[,c(1:4,7,8)]
#2=controls allele 1
controls471<-mutate(controls471, version=2)
#controls472<-mutate(controls472, version=4)
names<-c('chr','bp','n_alleles','n_chr','allele','frequency', 'version')
#hashed out cause done already
colnames(controls471)<-names
#colnames(controls472)<-names
#controls47_new<-add_row(controls471,controls472)
#ggplot(controls47_new, mapping=aes(bp,frequency))+
  #geom_point(aes(colour=version))

#now plot for the whole shebang (47)lol #########
complete_47<-add_row(cases471,controls471)
ggplot(complete_47, mapping=aes(bp,frequency))+
  geom_point(aes(colour=version))

###checking that allele 1 & 2 are the same for both cases vs controls######
identical(cases251$allele,controls251$allele)
#identical=> can plot the frequencies for them as direct comparisons ######
complete_25$version[complete_25$version==1]<-'cases'
complete_25$version[complete_25$version==2]<-'controls'
ggplot(complete_25, mapping=aes(bp,frequency))+
  geom_point(aes(colour=version))

###look at differences in frequency#########
controls251%>%
  right_join(cases251,by= 'bp')%>%
  {.->>cjoin_complete25}
#x=controls, y=cases
cjoin_complete25$frequency.x<-as.numeric(cjoin_complete25$frequency.x)
cjoin_complete25$frequency.y<-as.numeric(cjoin_complete25$frequency.y)
cjoin_complete25<-cjoin_complete25[,c(1:7,11:13)]
cjoin_complete25%>%
  mutate(diff=abs(frequency.x-frequency.y))%>%
  {.->>cjoin_complete25}
ggplot(cjoin_complete25,mapping=aes(bp,diff))+
  geom_point(mapping=aes())+
  labs(title='Absolute difference in AF',
       subtitle='Between cases and controls on chr 23 between 25-32mbp',
       x='Position in mbp', y='Difference in frequency')+
  ylim(0.0,0.8)

####frequency diffs for 47######
controls471%>%
  right_join(cases471,by= 'bp')%>%
  {.->>cjoin_complete47}
#x=controls, y=cases
cjoin_complete47$frequency.x<-as.numeric(cjoin_complete47$frequency.x)
cjoin_complete47$frequency.y<-as.numeric(cjoin_complete47$frequency.y)
cjoin_complete47<-cjoin_complete47[,c(1:7,11:13)]
cjoin_complete47%>%
  mutate(diff=abs(frequency.x-frequency.y))%>%
  {.->>cjoin_complete47}

ggplot(cjoin_complete47,mapping=aes(bp,diff))+
  geom_point(mapping=aes())+
  labs(title='Absolute difference in AF',
       subtitle='Between cases and controls on chr 23 between 47-52mbp', 
       x='Position in mbp', y='Difference in frequency')+
  ylim(0.0,0.8)

        