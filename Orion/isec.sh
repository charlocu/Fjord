#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=isec  
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

module load VCFtools
module load BCFtools

 
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/freebayes/fb_variants.vcf
#bcftools index /net/cn-1/mnt/SCRATCH/charlocu/VC/freebayes/fb_variants.vcf.gz
#bcftools index /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/filtered_variants.vcf.gz
#bcftools isec -c both /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/filtered_variants.vcf.gz \
#/net/cn-1/mnt/SCRATCH/charlocu/VC/freebayes/fb_variants.vcf.gz \
#-p /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/

#for the rm vs um genome attempts
#mkdir /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/RM/fb_rm_variants.vcf
#bcftools index /net/cn-1/mnt/SCRATCH/charlocu/RM/fb_rm_variants.vcf.gz
#bcftools view /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf.gz -r 23 > /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/um_23.vcf
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/um_23.vcf
#bcftools index /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/um_23.vcf.gz
#bcftools isec -c both /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/um_23.vcf.gz \
#/net/cn-1/mnt/SCRATCH/charlocu/RM/fb_rm_variants.vcf.gz \
#-p /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM

#getting stats to make my venn diagram lol
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM/0000.vcf
#bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM/0000.vcf.gz > stats_0000
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM/0001.vcf
#bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM/0001.vcf.gz >stats_0001
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM/0002.vcf
#bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM/0002.vcf.gz >stats_0002
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM/0003.vcf
#bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/RM/0003.vcf.gz >stats_0003

#slight aside to just bgzip the other files i had
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0000.vcf
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0001.vcf
#bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0003.vcf

#yet another aside lol to get some more stats
#chr 23 from the freebayes file
bcftools view /net/cn-1/mnt/SCRATCH/charlocu/VC/freebayes/fb_variants.vcf.gz -r 23 > /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/fb_23.vcf
bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/fb_23.vcf
bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/fb_23.vcf.gz > fb_23stats

#chr 23 of HC
bcftools view /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/filtered_variants.vcf.gz -r 23 > /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/hc_23.vcf
bgzip /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/hc_23.vcf
bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/hc_23.vcf.gz > hc_23stats

#finally of the rm one
bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/RM/fb_rm_variants.vcf.gz > rm_23stats







