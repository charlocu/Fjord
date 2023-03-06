#!/bin/bash
#SBATCH --ntasks=2               # 1 cores (CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=filter_vcf  
#SBATCH --mem=10G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     
#SBATCH --mail-user=charlottecuffe@gmail.com 
#SBATCH --mail-type=ALL		#all of the info please 

#filtering the variant files separately then combining to one file with filtered variants removed

source activate gatk 
/mnt/users/charlocu/miniconda3/bin/gatk \
VariantFiltration -V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output_snps.vcf.gz \
-filter 'QD <2.0' --filter-name 'QD2' \
-filter 'QUAL < 30.0' --filter-name 'QUAL30' \
-filter 'SOR > 3.0' --filter-name 'SOR3' \
-filter 'FS > 60.0' --filter-name 'FS60' \
-filter 'MQ < 40.0' --filter-name 'MQ40' \
-filter 'MQRankSum < -12.5' --filter-name 'MQRankSum-12.5' \
-filter 'ReadPosRankSum < -8.0' --filter-name 'ReadPosRankSum-8' \
-O /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output2_snps.vcf.gz

/mnt/users/charlocu/miniconda3/bin/gatk \
VariantFiltration -V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output_indels.vcf.gz \
-filter 'QD < 2.0' --filter-name 'QD2' \
-filter 'QUAL < 30.0' --filter-name 'QUAL30' \
-filter 'FS > 200.0' --filter-name 'FS200' \
-filter 'ReadPosRankSum < -20.0' --filter-name 'ReadPosRankSum-20' \
-O /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output2_indels.vcf.gz

#then merge files into 1 and remove filtered variants from file
/mnt/users/charlocu/miniconda3/bin/gatk \
SortVcf \
-I /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output2_snps.vcf.gz \
-I /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/gatk_output2_indels.vcf.gz \
-O /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/sorted_variants.vcf.gz
/mnt/users/charlocu/miniconda3/bin/gatk \
SelectVariants -V /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/sorted_variants.vcf.gz \
-O /net/cn-1/mnt/SCRATCH/charlocu/VC/Hap_Cal/filtered_variants.vcf.gz \
--exclude-filtered true
