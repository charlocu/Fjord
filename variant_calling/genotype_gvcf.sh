#!/bin/bash
#SBATCH --ntasks=10               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=combine_geno  
#SBATCH --mem=50G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

#first combining the individual variant files then joint genotyping of the files
source activate gatk 
/mnt/users/charlocu/miniconda3/bin/gatk \
--java-options "-Xmx4g -Xms4g" GenomicsDBImport \
--genomicsdb-workspace-path /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/my_database \
-L 3 -L 6 -L 14 -L 16 -L 23 \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9019.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9022.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9071.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9082.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9097.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9119.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9125.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9143.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9149.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9177.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9185.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9196.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9199.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9207.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9274.g.vcf.gz \
-V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/variants_fh9324.g.vcf.gz \
--tmp-dir /net/cn-1/mnt/SCRATCH/charlocu/recal_tmp
#step two joint genotyping
/mnt/users/charlocu/miniconda3/bin/gatk \
--java-options "-Xmx4g" GenotypeGVCFs \
-R /net/fs-1/projects01/fjord_illumina/Alignment/Equus_caballus.EquCab3.0.dna.toplevel.fa \
-V gendb:///net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/my_database \
-O /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output.vcf.gz \
-L 3 -L 6 -L 14 -L 16 -L 23 \
--tmp-dir /net/cn-1/mnt/SCRATCH/charlocu/recal_tmp