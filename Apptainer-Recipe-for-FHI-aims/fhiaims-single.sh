#!/bin/bash
#SBATCH -J FHI-aims-single   # Job name
#SBATCH -p common            # Partition name
#SBATCH -N 1                 # Total no. of nodes
#SBATCH --ntasks-per-node 64 # Tasks per node
#SBATCH --mem=10G            # Memory per node

cd $SLURM_SUBMIT_DIR
apptainer exec fhiaims.sif mpirun -n $SLURM_NTASKS aims.x > aims.out 2> aims.err
