source "$SLURM_BASE_DIR/dataset-settings.sh"

source "$SLURM_BASE_DIR/load-module.sh"

source "$SLURM_BASE_DIR/set-partition-run.sh"

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
		
		echo "$EXE -d $DATASET_NAME -f $OUTPUT_DATASET_FILE"

		time "$EXE" -d "$DATASET_NAME" -f "$OUTPUT_DATASET_FILE"
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
