#!/bin/bash
#SBATCH -p G1Part_sce
#SBATCH -N 20
#SBATCH --ntasks-per-node=25
#SBATCH -n 500
#SBATCH --exclusive
#SBATCH -J G155-300
#SBATCH -t 240:00:00

unset I_MPI_PMI_LIBRARY
export I_MPI_JOB_RESPECT_PROCESS_PLACEMENT=0

ulimit -s unlimited
ulimit -l unlimited
module purdge
module add gcc/9.3.0
source /es01/paratera/sce4927/.bashrc
source /es01/paratera/parasoft/oneAPI/2022.1/setvars.sh
APP=/es01/paratera/sce4927/DGHF/dghf/examples/dghf
mpirun -n 500 $APP


