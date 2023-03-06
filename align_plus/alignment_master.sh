#!/bin/bash
#SBATCH --ntasks=8               # 8 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=alignment_fjord   # sensible name for the job
#SBATCH --mem=16G                 # Default memory per CPU is 3GB.
#SBATCH --partition=hugemem     #bc files are massive + alignment needs lots
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL

# If you would like to use more please adjust this.

## Below you can put your scripts
# If you want to load module
module purge                # Clean all modules
module load BWA/0.7.17-GCC-9.3.0
mkdir /net/fs-1/projects01/fjord_illumina/Alignment/FH9019
bwa index /net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa.gz
bwa mem -M -R '@RG\tID:FH9019\tLB:FH9019\tPL:ILLUMINA\tPM:HISEQ\tSM:FH9019' -t 8 \
/net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa.gz \
 /net/fs-1/projects01/fjord_illumina/X204SC21111696-Z01-F002_01/raw_data/FH9019/FH9019_1.fq.gz \
/net/fs-1/projects01/fjord_illumina/X204SC21111696-Z01-F002_01/raw_data/FH9019/FH9019_2.fq.gz \
> /net/fs-1/projects01/fjord_illumina/Alignment/FH9019/align_fh9019.sam
