#!/bin/bash
#SBATCH --ntasks=1               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=recal_fh9019  # sensible name for the job
#SBATCH --mem=30G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

mkdir /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019
gunzip /net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa.gz
gunzip /net/fs-1/projects01/fjord_illumina/Alignment/equus_caballus_incl_consequences.vcf.gz

#1. analysis base scores
singularity exec /cvmfs/singularity.galaxyproject.org/all/gatk4:4.2.5.0--hdfd78af_0 gatk BaseRecalibrator \
--tmp-dir /net/cn-1/mnt/SCRATCH/charlocu/recal_tmp/ \
-R /net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa \
-I /net/cn-1/mnt/SCRATCH/charlocu/md_index/md_sorted_fh9019.bam \
--known-sites /net/fs-1/projects01/fjord_illumina/Alignment/equus_caballus_incl_consequences.vcf \
-O /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_data_fh9019.table

#2. applying recalibration
singularity exec /cvmfs/singularity.galaxyproject.org/all/gatk4:4.2.5.0--hdfd78af_0 gatk ApplyBQSR \
--tmp-dir /net/cn-1/mnt/SCRATCH/charlocu/recal_tmp/ \
-R /net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa \
-I /net/cn-1/mnt/SCRATCH/charlocu/md_index/md_sorted_fh9019.bam \
--bqsr-recal-file /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_data_fh9019.table \
-O /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_fh9019.bam

#3. second pass of base score analysis
singularity exec /cvmfs/singularity.galaxyproject.org/all/gatk4:4.2.5.0--hdfd78af_0 gatk BaseRecalibrator \
--tmp-dir /net/cn-1/mnt/SCRATCH/charlocu/recal_tmp/ \
-R /net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa \
-I /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_fh9019.bam \
--known-sites /net/fs-1/projects01/fjord_illumina/Alignment/equus_caballus_incl_consequences.vcf \
-O /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_data_fh9019_2.table

#4. analyse difference, did BQSR work well?? this part never worked for me so made own graphs in R
singularity exec /cvmfs/singularity.galaxyproject.org/all/gatk4:4.2.5.0--hdfd78af_0 gatk AnalyzeCovariates \
-before /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_data_fh9019.table \
-after /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/recal_data_fh9019_2.table \
--tmp-dir /net/cn-1/mnt/SCRATCH/charlocu/recal_tmp/ \
-plots /net/cn-1/mnt/SCRATCH/charlocu/BQS_recalibration/fh9019/AnalyzeCovariates_fh9019.pdf