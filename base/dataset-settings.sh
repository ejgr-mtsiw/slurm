## Main dataset name
DATASET_NAME="dados"

## Dataset directories
DATASET_DIR="$HOME_DIR/datasets"
DATASET_TMP_DIR="$DATASET_DIR/tmp"

INPUT_DATASET_FILE="$DATASET_DIR/$DATASET_FILE"

## The operation changes the dataset file used so we need to make a copy
OUTPUT_DATASET_FILE="$DATASET_TMP_DIR/$(date +%s%N)_$DATASET_FILE"
