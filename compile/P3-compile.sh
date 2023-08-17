#!/bin/bash

#SBATCH --job-name="P3-compile"

## Output filename must be set as soon as possible
#SBATCH --output=out.%x.%j
##SBATCH --error=err.%x.%j

source "../base/base.sh"

#MAKEFILE_RELEASE="debug"
#MAKEFILE_RELEASE="release"
MAKEFILE_RELEASE="release-with-microseconds"

MAKEFILE_PATH="$HOME_DIR/laid-by-columns"

source "$SLURM_BASE_DIR/compile.sh"
