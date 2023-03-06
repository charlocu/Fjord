#QC##########
#data is from plink + imported from excel doc
mean(fjord$`O(HET)`)+ 3*sqrt(var(fjord$`O(HET)`))
mean(fjord$`O(HET)`)- 3*sqrt(var(fjord$`O(HET)`))

ggplot(data=fjord, mapping=aes(x=`O(HET)`, y=F_MISS))+
  geom_point()+
  geom_hline(yintercept=0.03)+
  geom_vline(xintercept = 0.2978085)+
  geom_vline(xintercept = 0.2358934)+
  xlab('observed heterozygosity')+
  ylab('Prop missing SNPs')