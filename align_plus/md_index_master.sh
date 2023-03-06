#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=md_fjord9019   # sensible name for the job
#SBATCH --mem=3G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     #wants lots of space
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL

module load SAMtools
/mnt/users/thut/miniconda3/bin/picard MarkDuplicates \
I=/net/cn-1/mnt/SCRATCH/charlocu/Alignment/sorted_fh9019.bam \
O=/net/cn-1/mnt/SCRATCH/charlocu/md_index/md_sorted_fh9019.bam \
M=/net/cn-1/mnt/SCRATCH/charlocu/md_index/dups9019.metrics.txt
samtools index /net/cn-1/mnt/SCRATCH/charlocu/md_index/md_sorted_fh9019.bam