#!/bin/bash
#SBATCH --job-name='P2-6-c2_a8M_o2k_i100_u40_p26.h5'
#SBATCH --output=out.%x.%j
#SBATCH --nodes=1
#SBATCH --ntasks=6
## RUN PARTITION
# Be sure to request the correct partition to avoid the job to be held in the queue, furthermore
#       on CIRRUS-B (Minho)  choose for example HPC_4_Days
#       on CIRRUS-A (Lisbon) choose for example hpc
#SBATCH --partition=hpc
# Disable warning for mismatched library versions
# Cirrus.8 HAD different hdf5 versions on short and hpc partitions
# even if we load the same module
# ##Headers are 1.14.0, library is 1.10.5
#HDF5_DISABLE_VERSION_CHECK=1 # Runs but shows warning message
#HDF5_DISABLE_VERSION_CHECK=2 # Runs without showing the warning message
#export HDF5_DISABLE_VERSION_CHECK

# Used to guarantee that the environment does not have any other loaded module
module purge

# Load software modules. Please check session software for the details
module load gcc11/libs/hdf5/1.14.0
HOME_DIR="/users3/uaberta/eribeiro"
DATASET_FILE="c2_a8M_o2k_i100_u40_p26.h5"
REMOVE_DATASET="YES"
## Main dataset name
DATASET_NAME="dados"

## Dataset directories
DATASET_DIR="$HOME_DIR/datasets"
DATASET_TMP_DIR="$DATASET_DIR/tmp"

INPUT_DATASET_FILE="$DATASET_DIR/$DATASET_FILE"

## The operation changes the dataset file used so we need to make a copy
OUTPUT_DATASET_FILE="$DATASET_TMP_DIR/$(date +%s%N)_$DATASET_FILE"
RUN_TASKS=6
EXE="$HOME_DIR/laid-matrix-in-dataset/bin/laid-hdf5-mpi"

## DON'T CHANGE THIS!

# Run
if [ -f "$INPUT_DATASET_FILE" ]
then
	echo "=== Making a copy of the dataset ==="
	echo "cp $INPUT_DATASET_FILE $OUTPUT_DATASET_FILE"

	cp "$INPUT_DATASET_FILE" "$OUTPUT_DATASET_FILE"

	if [ $? -ne 0 ]
	then
		echo "Error copying $INPUT_DATASET_FILE to $OUTPUT_DATASET_FILE"
		exit 1
	fi

	echo "=== Running ==="
	if [ -f "$EXE" ]
	then
		chmod u+x "$EXE"
		
		echo "mpiexec -np $RUN_TASKS $EXE -d $DATASET_NAME -f $OUTPUT_DATASET_FILE"

		time mpiexec -np $RUN_TASKS "$EXE" -d "$DATASET_NAME" -f "$OUTPUT_DATASET_FILE"
	else
		echo "$EXE not found!"
	fi

	if [ $REMOVE_DATASET == "YES" ]
	then
		echo "=== Removing dataset ==="
		echo "rm $OUTPUT_DATASET_FILE"

		rm "$OUTPUT_DATASET_FILE"
	fi
else
        echo "Input dataset not found! [$INPUT_DATASET_FILE]"
fi

echo "Finished with job ID: $SLURM_JOBID"

sbatch P2-12-c2_a8M_o2k_i100_u40_p26.h5.1692715001692724320.sh
