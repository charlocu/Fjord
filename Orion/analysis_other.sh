#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=analyse  
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

module load VCFtools

#let the analysis begin, first relatedness

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--relatedness2 --out fjord

#looking at site quality

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 \
#--site-quality --out quality_23

#now a test of heterozygosity

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--het --out fjord

#tstv summary stats

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 \
#--TsTv-summary --out chr23

#my way to get the number of indels i used lol
#group 1 is the cases

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 \
#--keep-only-indels \
#--freq --out cases

#group 2 is the controls

#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--keep /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 \
#--keep-only-indels \
#--freq --out cases

#weir FST for KIT gene
vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 3 --from-bp 79500000 --to-bp 79700000 \
--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
--out weir3












