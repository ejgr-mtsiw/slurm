#!/bin/bash

#SBATCH --job-name="P2-compile"

## Output filename must be set as soon as possible
#SBATCH --output=out.%x.%j
##SBATCH --error=err.%x.%j

source "../base/base.sh"

#MAKEFILE_RELEASE="debug"
#MAKEFILE_RELEASE="release"
MAKEFILE_RELEASE="release-with-microseconds"

MAKEFILE_PATH="$HOME_DIR/laid-matrix-in-dataset"

source "$SLURM_BASE_DIR/compile.sh"
