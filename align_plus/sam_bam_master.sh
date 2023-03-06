#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=bam_fjord9019   # sensible name for the job
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     #wants lots of space
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL

module load SAMtools
/mnt/users/thut/miniconda3/bin/picard SortSam \
INPUT=/net/fs-1/projects01/fjord_illumina/Alignment/FH9019/align_fh9019.sam \
OUTPUT=/net/cn-1/mnt/SCRATCH/charlocu/Alignment/sorted_fh9019.bam \
TMP_DIR=/net/cn-1/mnt/SCRATCH/charlocu/temp_bam/ \
SORT_ORDER=coordinate
samtools flagstat /net/cn-1/mnt/SCRATCH/charlocu/Alignment/sorted_fh9019.bam \
> /net/cn-1/mnt/SCRATCH/charlocu/Alignment/sorted_fh9019.stats