#!/bin/bash

# In this batch we compare the impact of the number of observations and
# processes.  We run only the P3 and P4 prototypes in datasets with fixed 1M
# attributes and observations ranging from 1k to 16k (two classes ~50% obs each)
# to compare the effect on runtime for different number of processes
#
# Goin for 1, 2, 3, 6, 12, 24, 48, 96, 192 processes
#
# c2_a1M_o1k_i100_u40_p26.h5
# c2_a1M_o2k_i100_u40_p26.h5
# c2_a1M_o4k_i100_u40_p26.h5
# c2_a1M_o8k_i100_u40_p26.h5
# c2_a1M_o16k_i100_u40_p26.h5

# Usage: run.sh N_TASKS N_NODES N_TASKS_PER_NODE PROTOTYPE DATASET_FILE REMOVE_DATASET QUEUE_SLURM REMOVE_SLURM

source "../base/base.sh"

processes=(2 3 6 12 24 48 96) #192 needs to be done by hand because it uses more than one node

datasets=(c2_a1M_o1k_i100_u40_p26.h5 c2_a1M_o2k_i100_u40_p26.h5 c2_a1M_o4k_i100_u40_p26.h5 c2_a1M_o8k_i100_u40_p26.h5 c2_a1M_o16k_i100_u40_p26.h5)

#P3:
mkdir -p P3
cd P3

for p in "${processes[@]}"
do
	for d in "${datasets[@]}"
	do
		bash "$SLURM_BASE_DIR/run.sh" "$p" 1 96 P3 "$d" YES YES NO
	done
done

#192 needs 2 nodes
for d in "${datasets[@]}"
do
	bash "$SLURM_BASE_DIR/run.sh" 192 2 96 P3 "$d" YES YES NO
done

cd ..

#P4:
mkdir -p P4
cd P4

for p in "${processes[@]}"
do
	for d in "${datasets[@]}"
	do
		bash "$SLURM_BASE_DIR/run.sh" "$p" 1 96 P4 "$d" YES YES NO
	done
done

#192 needs 2 nodes
for d in "${datasets[@]}"
do
	bash "$SLURM_BASE_DIR/run.sh" 192 2 96 P4 "$d" YES YES NO
done

cd ..
