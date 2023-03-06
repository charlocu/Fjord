#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=analyse  
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

#all commands were run just at different times hence some have # before

module load VCFtools
gunzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf
#analyse weirs FST on chr 23
#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 23 \
#--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
#--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
#--out weir23

#weir FST for KIT gene
#vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
#--maf 0.01 --hwe 1e-5 --minQ 30 \
#--chr 3 --from-bp 79500000 --to-bp 79700000 \
#--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
#--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
#--out weir3

#weir FST for PAX3
vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 6 --from-bp 11100000 --to-bp 11250000 \
--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
--out weir6

#weir FST for MITF
vcftools --vcf /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf \
--maf 0.01 --hwe 1e-5 --minQ 30 \
--chr 16 --from-bp 21500000 --to-bp 21760000 \
--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/cases.txt \
--weir-fst-pop /net/cn-1/mnt/SCRATCH/charlocu/VC/controls.txt \
--out weir16

gzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf











