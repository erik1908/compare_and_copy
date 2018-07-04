#!/bin/bash

READDIR="log_dir/"
TARGETDIR="log_dir/copy_of/"
FILE_PREFIX="orig*"
# if represent more than one object, use plural
READFILES=${READDIR}${FILE_PREFIX}


# It is needed to create, if needed, the target dir
# mkdir will create target_dir only if needed, so:
mkdir -p $TARGETDIR

for filename in $READFILES
do
  # Best practices: stick to a name criteria along the code. copy vs target?
  # Target is more explicit
  TARGETFILE=$TARGETDIR`basename "$filename"`
  ORIGFILE=$filename
  if [ ! -f $TARGETFILE ];
  then
    echo "$TARGETFILE not found, copying the file"
    cp $ORIGFILE $TARGETFILE
  else
    echo "$TARGETFILE found, copying new lines if needed"
    targetfile_nlines=$( wc -l < $TARGETFILE | awk '{print $1}')
    echo $targetfile_nlines
    sed 1,${targetfile_nlines}d $ORIGFILE >> $TARGETFILE
  fi
done
