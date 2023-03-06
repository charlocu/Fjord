#!/bin/bash
#SBATCH --ntasks=1               # 1 core(CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=multiqc_fjord   # sensible name for the job
#SBATCH --mem=1G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     # Use the smallmem-partition for jobs requiring < 10 GB RAM.
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL

module purge                # Clean all modules
module load MultiQC  # Load the multiqc software
multiqc /net/fs-1/projects01/fjord_illumina/FastQC/FH9019/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9022/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9071/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9082/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9097/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9119/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9125/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9143/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9149/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9177/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9185/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9196/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9199/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9207/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9274/ \
/net/fs-1/projects01/fjord_illumina/FastQC/FH9324/   #listing all the files for multiqc to check


