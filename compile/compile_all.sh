#!/bin/bash

echo "This will compile all the prototypes."
echo "Are you sure? (YES/NO): "
read confirm

if [ $confirm == "YES" ]
then
	echo "Adding P1 compile to the queue"
	sbatch P1-compile.sh

	echo "Adding P2 compile to the queue"
	sbatch P2-compile.sh

	echo "Adding P3 compile to the queue"
	sbatch P3-compile.sh

	echo "Adding P4 compile to the queue"
	sbatch P4-compile.sh
else
	echo "Cancelled"
fi
