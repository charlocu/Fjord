#!/bin/bash
#SBATCH --ntasks=1               # 1 core(CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=fastqc_fjord   # sensible name for the job
#SBATCH --mem=1G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     # Use the smallmem-partition for jobs requiring < 10 GB RAM.
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL

# If you would like to use more please adjust this.

## Below you can put your scripts
# If you want to load module
module purge                # Clean all modules
module load FastQC  # Load the Samtools software
mkdir /net/fs-1/projects01/fjord_illumina/FastQC/FH9019 
fastqc /net/fs-1/projects01/fjord_illumina/X204SC21111696-Z01-F002_01/raw_data/FH9019/FH9019_1.fq.gz \
/net/fs-1/projects01/fjord_illumina/X204SC21111696-Z01-F002_01/raw_data/FH9019/FH9019_2.fq.gz \
-o /net/fs-1/projects01/fjord_illumina/FastQC/FH9019 