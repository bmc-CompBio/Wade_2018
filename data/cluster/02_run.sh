#! /bin/bash

NUMRUNS=`sed 1d SraRunTable.txt |wc -l | awk '{print($1)}'`
if [ $NUMRUNS -ge 0 ]; then
	jid1=$(sbatch --parsable --array=1-$NUMRUNS RSEM_STAR_array.batch)
fi

sbatch --dependency=afterany:$jid1 cleanup.sh