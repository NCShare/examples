#!/bin/bash
#SBATCH -J mpi_ring_test      # Job name
#SBATCH -p common             # Partition name
#SBATCH -N 2                  # Total # of nodes
#SBATCH --ntasks-per-node 4   # Tasks per node

cd $SLURM_SUBMIT_DIR

# Compile
mpif90 mpi_ring_test.f90 -o mpi_ring_test

# Execute
mpirun -n $SLURM_NTASKS ./mpi_ring_test > mpi_ring_test_output.txt
