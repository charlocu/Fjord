#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=chr23  # sensible name for the job
#SBATCH --mem=6G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

module load SAMtools
#ones hashed out were already run on command line before writing the bash script
#samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_fh9019.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9019_chr23.bam
#samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9022/recal_fh9022.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9022_chr23.bam
#samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9071/recal_fh9071.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9071_chr23.bam
#samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9082/recal_fh9082.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9082_chr23.bam
#now ones to run
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9097/recal_fh9097.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9097_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9119/recal_fh9119.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9119_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9125/recal_fh9125.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9125_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9143/recal_fh9143.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9143_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9149/recal_fh9149.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9149_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9177/recal_fh9177.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9177_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9185/recal_fh9185.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9185_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9196/recal_fh9196.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9196_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9199/recal_fh9199.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9199_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9207/recal_fh9207.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9207_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9274/recal_fh9274.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9274_chr23.bam
samtools view -b -h /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9324/recal_fh9324.bam 23 > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9324_chr23.bam
#now making the .bam.bai files
#first ones done already in cmd line
#samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9019_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9019_chr23.bam.bai
#samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9022_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9022_chr23.bam.bai
#samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9071_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9071_chr23.bam.bai
#samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9082_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9082_chr23.bam.bai
#now ones remaining to do
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9097_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9097_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9119_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9119_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9125_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9125_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9143_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9143_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9149_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9149_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9177_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9177_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9185_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9185_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9196_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9196_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9199_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9199_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9207_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9207_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9274_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9274_chr23.bam.bai
samtools index /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9324_chr23.bam > /net/cn-1/mnt/SCRATCH/charlocu/chr23/fh9324_chr23.bam.bai

























