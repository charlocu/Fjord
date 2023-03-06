#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=combine_geno  
#SBATCH --mem=3G                # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

module load BCFtools
#bcftools stats filtered_variants.vcf.gz> vcf_stats.vchk
#plot-vcfstats -p outdir /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/vcf_stats.vchk

#bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/VC/freebayes/fb_variants.vcf.gz> vcf_fb_stats.vchk
bcftools stats /net/cn-1/mnt/SCRATCH/charlocu/VC/analyse/0002.vcf.gz> 0002_stats.vchk

