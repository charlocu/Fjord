#!/bin/bash
#SBATCH --ntasks=3               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=separate_variants  
#SBATCH --mem=12G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please

source activate gatk
/mnt/users/charlocu/miniconda3/bin/gatk SelectVariants \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output.vcf.gz \
-select-type SNP \
-O gatk_output_snps.vcf.gz
/mnt/users/charlocu/miniconda3/bin/gatk SelectVariants \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output.vcf.gz \
-select-type INDEL -select-type MIXED  \
-O gatk_output_indels.vcf.gz