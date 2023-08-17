source "$SLURM_BASE_DIR/set-partition-compile.sh"

source "$SLURM_BASE_DIR/load-module.sh"

# Compile application
cd "$MAKEFILE_PATH"
make clean
make "$MAKEFILE_RELEASE"

echo "Finished with job $SLURM_JOBID"
