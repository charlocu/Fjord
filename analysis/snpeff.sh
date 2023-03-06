#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=snpeff  
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     

#this script has all the snpeff commands used, not everything was run at the same time
#some commands were run at later times but just kept everything together in this script

#java -jar /net/fs-1/projects01/fjord_illumina/snpEff/snpEff.jar EquCab3.0 \
#/net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/regions.vcf | gzip > regions_annotate.vcf.gz

#snpsift to look at cases vs controls
#java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar caseControl \
#"---+-+--+-+-++++" /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/regions_annotate.vcf.gz 
#| gzip > casecontrol.vcf.gz

#then CC_Allelic p>0.005
#gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf.gz
#cat /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf \
#| java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar \
#filter " CC_ALL < 0.005 " > cc_all.vcf 
#gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf

#then looking at the geno results cause this lette 2007 says this best for unknown inheritance modes
#gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf.gz
#cat /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf \
#| java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar \
#filter " CC_GENO < 0.005 " > cc_geno.vcf 
#gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf

#now looking at dom ones cause it probably partially dominant
#gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf.gz
#cat /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf \
#| java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar \
#filter " CC_DOM < 0.005 " > cc_dom.vcf 
#gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf

#now looking at rec ones cause that rieder paper said theyre rec w/white reducing dominant
gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf.gz
cat /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf \
| java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar \
filter " CC_REC < 0.005 " > cc_rec.vcf 
gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf

#less stringent p value
#filtering on the casecontrol vcf first CC_Allelic  verison p>0.05
gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf.gz
cat /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf \
| java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar \
filter " CC_ALL < 0.05 " > cc_all05.vcf 
#gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf

#then looking at the geno results cause this lette 2007 says this best for unknown inheritance modes
#gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf.gz
cat /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf \
| java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar \
filter " CC_GENO < 0.05 " > cc_geno05.vcf 
#gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf

#now looking at dom ones cause it probably partially dominant
#gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf.gz
cat /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf \
| java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar \
filter " CC_DOM < 0.05 " > cc_dom05.vcf 
#gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf

#now looking at rec ones cause that rieder paper said theyre rec w/white reducing dominant
#gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf.gz
cat /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf \
| java -jar /net/fs-1/projects01/fjord_illumina/snpEff/SnpSift.jar \
filter " CC_REC < 0.05 " > cc_rec05.vcf 
gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/scripts/casecontrol.vcf














