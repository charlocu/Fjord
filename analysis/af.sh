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

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 25000000 --to-bp 32000000 \
--freq --out freq25_chr23_cases

#group 2 is the controls

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 25000000 --to-bp 32000000 \
--freq --out freq25_chr23_controls

#let the analysis begin, first allele frequencies second 47mbp
#group 1 is the cases

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 47000000 --to-bp 52000000 \
--freq --out freq47_chr23_cases

#group 2 is the controls

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 47000000 --to-bp 52000000 \
--freq --out freq47_chr23_controls

########now AF from other locations

#let the analysis begin, first gene= KIT
#group 1 is the cases

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 3 --from-bp 79500000 --to-bp 79700000 \
--freq --out freq_chr3_cases

#group 2 is the controls

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 3 --from-bp 79500000 --to-bp 79700000 \
--freq --out freq_chr3_controls

#let the analysis begin, next MITF
#group 1 is the cases

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 16 --from-bp 21500000 --to-bp 21760000 \
--freq --out freq_chr16_cases

#group 2 is the controls

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 16 --from-bp 21500000 --to-bp 21760000 \
--freq --out freq_chr16_controls

#let the analysis begin, next PAX3
#group 1 is the cases

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 6 --from-bp 11100000 --to-bp 11250000 \
--freq --out freq_chr6_cases

#group 2 is the controls

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 6 --from-bp 11100000 --to-bp 11250000 \
--freq --out freq_chr6_controls


########Analysis for RM genome 
vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/RM/fb_rm_variants.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 25000000 --to-bp 32000000 \
--freq --out freq25rm_chr23_cases


#group 2 is the controls
#the single sample here is a case so no control
#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/RM/fb_rm_variants.vcf \
#--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 --from-bp 25000000 --to-bp 32000000 \
#--freq --out freq25rm_chr23_controls

#let the analysis begin, first allele frequencies around 47mbp
#group 1 is the cases

vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/RM/fb_rm_variants.vcf \
--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 23 --from-bp 47000000 --to-bp 52000000 \
--freq --out freq47rm_chr23_cases


#group 2 is the controls
#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/RM/fb_rm_variants.vcf \
#--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 --from-bp 47000000 --to-bp 52000000 \
#--freq --out freq47rm_chr23_controls










