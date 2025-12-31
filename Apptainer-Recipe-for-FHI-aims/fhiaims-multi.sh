#!/bin/bash
#SBATCH -J FHI-aims-multi    # Job name
#SBATCH -p common            # Partition name
#SBATCH -N 2                 # Total no. of nodes
#SBATCH --ntasks-per-node 64 # Tasks per node
#SBATCH --mem=10G            # Memory per node

# Initialize host Intel oneAPI environment
source /hpc/home/uherathmudiyanselage1/intel/oneapi/setvars.sh --force > /dev/null

cd $SLURM_SUBMIT_DIR

mpirun -n $SLURM_NTASKS \
     apptainer exec \
     fhiaims.sif \
     aims.x > aims.out 2> aims.err
