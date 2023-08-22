#!/bin/bash

# In this batch we compare the four prototypes directly by running
# several datasets with all programs set to use only one process
# We only use datasets that all prototypes can use (<1.5TB disk space)
#
# c2_a100k_o2k_i100_u40_p26.h5
# c2_a1M_o1k_i100_u40_p26.h5
# c2_a1M_o2k_i100_u40_p26.h5
# c2_a1M_o4k_i100_u40_p26.h5
# c2_a1M_o8k_i100_u40_p26.h5
# c2_a1M_o16k_i100_u40_p26.h5
# c2_a2M_o2k_i100_u40_p26.h5
# c2_a4M_o2k_i100_u40_p26.h5
# c2_a8M_o2k_i100_u40_p26.h5
# c2_a16M_o2k_i100_u40_p26.h5

# Usage: run.sh N_TASKS N_NODES N_TASKS_PER_NODE PROTOTYPE DATASET_FILE REMOVE_DATASET QUEUE_SLURM REMOVE_SLURM

source "../base/base.sh"

#P1: no autoqueue: P1 and P2 must be run individually, because they use the disk
mkdir -p P1
cd P1
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P1 c2_a100k_o2k_i100_u40_p26.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P1 c2_a1M_o2k_i100_u40_p26.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P1 c2_a2M_o2k_i100_u40_p26.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P1 c2_a4M_o2k_i100_u40_p26.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P1 c2_a8M_o2k_i100_u40_p26.h5 YES NO NO
#bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P1 c2_a16M_o2k_i100_u40_p26.h5 YES NO NO # can't run - no disk space
cd ..

#P2: no autoqueue: P1 and P2 must be run individually, because they use the disk
mkdir -p P2
cd P2
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P2 c2_a100k_o2k_i100_u40_p26.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P2 c2_a1M_o2k_i100_u40_p26.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P2 c2_a2M_o2k_i100_u40_p26.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P2 c2_a4M_o2k_i100_u40_p26.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P2 c2_a8M_o2k_i100_u40_p26.h5 YES NO NO
#bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P2 c2_a16M_o2k_i100_u40_p26.h5 YES NO NO # can't run - no disk space
cd ..

#P3:
mkdir -p P3
cd P3
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P3 c2_a100k_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P3 c2_a1M_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P3 c2_a2M_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P3 c2_a4M_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P3 c2_a8M_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P3 c2_a16M_o2k_i100_u40_p26.h5 YES YES NO
cd ..

#P4:
mkdir -p P4
cd P4
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P4 c2_a100k_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P4 c2_a1M_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P4 c2_a2M_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P4 c2_a4M_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P4 c2_a8M_o2k_i100_u40_p26.h5 YES YES NO
bash "$SLURM_BASE_DIR/run.sh" 1 1 96 P4 c2_a16M_o2k_i100_u40_p26.h5 YES YES NO
cd ..
