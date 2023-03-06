#!/bin/bash
#SBATCH --ntasks=1               # 1 core(CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=multiqc_fjord   # sensible name for the job
#SBATCH --mem=1G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem     # Use the smallmem-partition for jobs requiring < 10 GB RAM.
#SBATCH --mail-user=charlottecuffe@gmail.com # Email me when job is done.
#SBATCH --mail-type=ALL


module load MultiQC  # Load the multiqc software
multiqc /net/cn-1/mnt/SCRATCH/charlocu/Alignment/   #listing all the files for multiqc to check


