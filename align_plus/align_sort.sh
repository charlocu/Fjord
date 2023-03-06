#!/bin/bash
#SBATCH --ntasks=8               # 8 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=alignment_fjord   # sensible name for the job
#SBATCH --mem=16G                 # Default memory per CPU is 3GB.
#SBATCH --partition=hugemem --constraint=avx2    #bc files are massive + alignment needs lots
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL


module purge                # Clean all modules
module load BWA/0.7.17-GCC-9.3.0 #load BWA
module load SAMtools        #load SAMtools
bwa mem -M -R '@RG\tID:FH9324\tLB:FH9324\tPL:ILLUMINA\tPM:HISEQ\tSM:FH9324' -t 8 \
/net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa.gz \
/net/fs-1/projects01/fjord_illumina/X204SC21111696-Z01-F002_03/raw_data/FH9324/FH9324_1.fq.gz \
/net/fs-1/projects01/fjord_illumina/X204SC21111696-Z01-F002_03/raw_data/FH9324/FH9324_2.fq.gz \
| samtools sort -o /mnt/SCRATCH/charlocu/Alignment/sorted_fh9324.bam -
samtools flagstat /mnt/SCRATCH/charlocu/Alignment/sorted_fh9324.bam \
> /mnt/SCRATCH/charlocu/Alignment/sorted_fh9324.stats
