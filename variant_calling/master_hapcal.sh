#!/bin/bash
#SBATCH --ntasks=2               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=HC_9019  # sensible name for the job
#SBATCH --mem=20G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

#running haplotype caller in gvcf mode for joint genotyping
source activate gatk 
/mnt/users/charlocu/miniconda3/bin/gatk HaplotypeCaller -ERC GVCF \
-R /net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa \
-I /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_fh9019.bam \
-O /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9019.g.vcf.gz
