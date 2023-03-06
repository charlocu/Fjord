#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=analyse  
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

module load VCFtools

#let the analysis begin, first allele frequencies first 25mp
#group 1 is the cases

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 --from-bp 25000000 --to-bp 32000000 \
#--site-mean-depth --out depth25_cases

#group 2 is the controls

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 --from-bp 25000000 --to-bp 32000000 \
#--site-mean-depth --out depth25_controls

#let the analysis begin, first allele frequencies second 47mbp
#group 1 is the cases

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 --from-bp 47000000 --to-bp 52000000 \
#--site-mean-depth --out depth47_cases

#group 2 is the controls

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 --from-bp 47000000 --to-bp 52000000 \
#--site-mean-depth --out depth47_controls

##next anaylsis hapr2 25mbp first
vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 25000000 --to-bp 32000000 \
--hap-r2 

##next anaylsis hapr2 47mbp next
vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 47000000 --to-bp 52000000 \
--hap-r2 


#geno r2
vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 25000000 --to-bp 32000000 \
--geno-r2 

##next anaylsis hapr2 47mbp next
vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 47000000 --to-bp 52000000 \
--geno-r2 














