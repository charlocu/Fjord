#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=dict_index  # sensible name for the job
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL

#/mnt/users/thut/miniconda3/bin/picard CreateSequenceDictionary \
#-R /net/cn-1/mnt/SCRATCH/charlocu/RM/Equus_caballus.EquCab3.0.dna_rm.toplevel.fa.gz
module load SAMtools
module load HTSlib
#gzip -d /net/cn-1/mnt/SCRATCH/charlocu/RM/Equus_caballus.EquCab3.0.dna_rm.toplevel.fa.gz \
samtools faidx /net/cn-1/mnt/SCRATCH/charlocu/RM/Equus_caballus.EquCab3.0.dna_rm.toplevel.fa 
gzip /net/cn-1/mnt/SCRATCH/charlocu/RM/Equus_caballus.EquCab3.0.dna_rm.toplevel.fa
