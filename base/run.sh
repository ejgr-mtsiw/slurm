#!/bin/bash

# Builds and queues a slurm batch file for our prototypes
# Usage: run.sh JOB_NAME N_TASKS N_NODES N_TASKS_PER_NODE PROTOTYPE DATASET_FILE REMOVE_DATASET QUEUE_SLURM REMOVE_SLURM
# 
# N_TASKS is the real number of processes to use
# N_NODES number of nodes to reserve
# N_TASKS_PER_NODE number os tasks per node
# PROTOTYPE one of P1, P2, P3, P4
# DATASET_FILE the name of the dataset to process - no path
# REMOVE_DATASET YES will remove dataset after job is done
# QUEUE_SLURM YES will queue file after build
# REMOVE_SLURM YES will remove the file after queue

if [ "$#" -ne 9 ]; then
    echo "Illegal number of parameters"
	exit 1
fi

JOB_NAME=$1
RUN_TASKS=$2
RUN_NODES=$3
RUN_TASKS_PER_NODE=$4
PROTOTYPE=$5
DATASET_FILE=$6
REMOVE_DATASET=$7
QUEUE_SLURM=$8
REMOVE_SLURM=$9

#Output filename
SLURM_FILE_NAME="$PROTOTYPE-$RUN_NODES.$RUN_TASKS_PER_NODE-$JOB_NAME.$(date +%s%N).sh"

source "$(dirname $0)/base.sh"

#Build slurm run file
echo "#!/bin/bash" >> "$SLURM_FILE_NAME"
echo "#SBATCH --job-name='$JOB_NAME'" >> "$SLURM_FILE_NAME"
echo "#SBATCH --output=out.%x.%j" >> "$SLURM_FILE_NAME"

echo "#SBATCH --nodes=$RUN_NODES" >> "$SLURM_FILE_NAME"
echo "#SBATCH --ntasks-per-node=$RUN_TASKS_PER_NODE" >> "$SLURM_FILE_NAME"

cat "$SLURM_BASE_DIR/set-partition-run.sh" >> $SLURM_FILE_NAME
cat "$SLURM_BASE_DIR/load-module.sh" >> $SLURM_FILE_NAME

echo "HOME_DIR=\"$HOME_DIR\"" >> $SLURM_FILE_NAME

## Dataset to process
echo "DATASET_FILE=\"$DATASET_FILE\"" >> $SLURM_FILE_NAME

## Remove the created dataset file after we're done? YES/NO
echo "REMOVE_DATASET=\"$REMOVE_DATASET\"" >> $SLURM_FILE_NAME

cat "$SLURM_BASE_DIR/dataset-settings.sh" >> $SLURM_FILE_NAME

echo "RUN_TASKS=$RUN_TASKS" >> $SLURM_FILE_NAME

case $PROTOTYPE in
	P1)
		EXE='$HOME_DIR/laid-c/bin/laid'
		echo "EXE=\"$EXE\"" >> "$SLURM_FILE_NAME"
		cat "$SLURM_BASE_DIR/run-with-copy.sh" >> $SLURM_FILE_NAME
		;;
	P2)
		EXE='$HOME_DIR/laid-matrix-in-dataset/bin/laid-hdf5-mpi'
		echo "EXE=\"$EXE\"" >> "$SLURM_FILE_NAME"
		cat "$SLURM_BASE_DIR/run-with-copy-mpi.sh" >> $SLURM_FILE_NAME
		;;
	P3) 
		EXE='$HOME_DIR/laid-by-columns/bin/laid-by-columns'
		echo "EXE=\"$EXE\"" >> "$SLURM_FILE_NAME"
		cat "$SLURM_BASE_DIR/run-without-copy.sh" >> $SLURM_FILE_NAME
		;;
	P4) 
		EXE='$HOME_DIR/laid-by-lines/bin/laid-by-lines'
		echo "EXE=\"$EXE\"" >> "$SLURM_FILE_NAME"
		cat "$SLURM_BASE_DIR/run-without-copy.sh" >> $SLURM_FILE_NAME
		;;
	*)
		echo "Unknown prototype"
		exit 1
		;;
esac

# Queue it?
if [ $QUEUE_SLURM == "YES" ]
then
	echo "Queueing $SLURM_FILE_NAME"
	sbatch "$SLURM_FILE_NAME"

	if [ $REMOVE_SLURM == "YES" ]
	then
		#Remove it
		echo "Removing $SLURM_FILE_NAME"
		rm "$SLURM_FILE_NAME"
	fi
fi
