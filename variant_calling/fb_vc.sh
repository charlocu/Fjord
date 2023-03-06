#!/bin/bash
#SBATCH --ntasks=10               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=fb_vc  
#SBATCH --mem=70G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

module load VCFtools/0.1.16-GCC-9.3.0
/net/fs-1/home01/charlocu/miniconda3/bin/freebayes \
-f /net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_fh9019.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9022/recal_fh9022.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9071/recal_fh9071.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9082/recal_fh9082.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9097/recal_fh9097.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9119/recal_fh9119.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9125/recal_fh9125.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9143/recal_fh9143.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9149/recal_fh9149.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9177/recal_fh9177.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9185/recal_fh9185.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9196/recal_fh9196.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9199/recal_fh9199.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9207/recal_fh9207.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9274/recal_fh9274.bam \
-b /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9324/recal_fh9324.bam \
> fb_variants.vcf
