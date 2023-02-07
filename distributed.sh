#!/bin/bash
#SBATCH --job-name=jldistributed     # create a short name for your job

#SBATCH --nodes=2
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=2
#SBATCH --mem=1G
#SBATCH --time=00:05:00
#SBATCH --partition=compute

module load julia/1.8.5

julia --project --threads=1 distributed_example.jl
rm julia-*.out