source "$SLURM_BASE_DIR/dataset-settings.sh"

source "$SLURM_BASE_DIR/load-module.sh"

source "$SLURM_BASE_DIR/set-partition-run.sh"

## DON'T CHANGE THIS!

# Run
if [ -f "$INPUT_DATASET_FILE" ]
then
	echo "=== Running ==="
	if [ -f "$EXE" ]
	then
		chmod u+x "$EXE"
		
		echo "mpiexec -np $RUN_TASKS $EXE -d $DATASET_NAME -f $INPUT_DATASET_FILE"

		time mpiexec -np $RUN_TASKS "$EXE" -d "$DATASET_NAME" -f "$INPUT_DATASET_FILE"
	else
		echo "$EXE not found!"
	fi
else
        echo "Input dataset not found! [$INPUT_DATASET_FILE]"
fi

echo "Finished with job ID: $SLURM_JOBID"
