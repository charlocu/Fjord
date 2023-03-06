#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=dict_index  # sensible name for the job
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL

gunzip /net/fs-1/projects01/fjord_illumina/Alignment/equus_caballus_incl_consequences.vcf.gz
source activate gatk 
/mnt/users/charlocu/miniconda3/bin/gatk IndexFeatureFile \
-I /net/fs-1/projects01/fjord_illumina/Alignment/equus_caballus_incl_consequences.vcf \
--tmp-dir /net/cn-1/mnt/SCRATCH/charlocu/recal_tmp/
gzip /net/fs-1/projects01/fjord_illumina/Alignment/equus_caballus_incl_consequences.vcf

