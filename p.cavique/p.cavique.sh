#!/bin/bash

# In this batch we compare the four prototypes directly by running
# them all on p.cavique_novo dataset
#
# p.cavique_c2_a1000000_o2000_novo.h5

# Usage: run.sh N_TASKS N_NODES N_TASKS_PER_NODE PROTOTYPE DATASET_FILE REMOVE_DATASET QUEUE_SLURM REMOVE_SLURM

source "../base/base.sh"

#P1: no autoqueue: P1 and P2 must be run individually, because they use the disk
mkdir -p P1
cd P1
bash "$SLURM_BASE_DIR/run.sh" 1 -1 96 P1 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
cd ..

#P2: no autoqueue: P1 and P2 must be run individually, because they use the disk
mkdir -p P2
cd P2
bash "$SLURM_BASE_DIR/run.sh" 1 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 2 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 3 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 6 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 12 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 24 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 48 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 96 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 192 -1 96 P2 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
cd ..

#P3:
mkdir -p P3
cd P3
bash "$SLURM_BASE_DIR/run.sh" 1 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 2 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 3 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 6 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 12 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 24 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 48 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 96 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 192 -1 96 P3 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
cd ..

#P4:
mkdir -p P4
cd P4
bash "$SLURM_BASE_DIR/run.sh" 1 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 2 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 3 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 6 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 12 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 24 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 48 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 96 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
bash "$SLURM_BASE_DIR/run.sh" 192 -1 96 P4 p.cavique_c2_a1000000_o2000_novo.h5 YES NO NO
cd ..
