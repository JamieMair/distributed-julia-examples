#!/bin/bash
#SBATCH --job-name=jlmpi     # create a short name for your job
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=00:05:00
#SBATCH --partition=devq

module load julia-uon/gcc9.3.0/1.6.0
module load OpenMPI/4.1.4-GCC-11.3.0

srun julia --project --threads=1 mpi_example.jl