#!/bin/bash

# In this batch we compare the impact of the number of processes
# We run all four prototypes in a defined dataset c2_a8M_o2k_i100_u40_p26.h5
# to compare the effect on runtime for different number of processes
#
# Goin for 1, 2, 3, 6, 12, 24, 48, 96, 192 processes
# We have results for one process in batch #1
# We allow multiple nodes on this run (must edit manually the generated files)
#
# c2_a8M_o2k_i100_u40_p26.h5

# Usage: run.sh N_TASKS N_NODES N_TASKS_PER_NODE PROTOTYPE DATASET_FILE REMOVE_DATASET QUEUE_SLURM REMOVE_SLURM

source "../base/base.sh"

processes=(2 3 6 12 24 48 96) #192

#P2: P1 and P2 must be run individually, because they use the disk
mkdir -p P2
cd P2

for p in "${processes[@]}"
do
	bash "$SLURM_BASE_DIR/run.sh" "$p" 0 0 P2 c2_a8M_o2k_i100_u40_p26.h5 YES NO NO
done

cd ..

#P3:
mkdir -p P3
cd P3

for p in "${processes[@]}"
do
	bash "$SLURM_BASE_DIR/run.sh" "$p" 0 0 P3 c2_a8M_o2k_i100_u40_p26.h5 YES NO NO
done

cd ..

#P4:
mkdir -p P4
cd P4

for p in "${processes[@]}"
do
	bash "$SLURM_BASE_DIR/run.sh" "$p" 0 0 P4 c2_a8M_o2k_i100_u40_p26.h5 YES NO NO
done

cd ..
