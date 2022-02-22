#!/bin/sh

filename="$1"

# simple check to make sure remote is mounted
if [ ! -d /valvonta-remote/etuhuone/ ]; then
  echo "remote not mounted" 1>&2
  exit 1
fi

# if no filename
if [ -z $filename ]; then
  # filter all new images and rsync them over - last two minutes
  find /motion-images/ -type f -mmin -1 -printf %P\\0 \
    | tee \
    | rsync -vrxW --timeout=20 --files-from=- --from0 /motion-images/ /valvonta-remote/

# else if first argument is days
elif [ $filename = "--days" ]; then
  days="$2"
  if [ -n $days ]; then
    # filter all new images and rsync them over - parametrized input
    find /motion-images/ -type f -mtime "-$days" -printf %P\\0 \
      | tee \
      | rsync -vrxW --timeout=20 --files-from=- --from0 /motion-images/ /valvonta-remote/
  else
    echo "see usage :D" 1>&2
    exit 1
  fi

# maybe it's a filename then, does it exist?
elif [ -f "$filename" ]; then
  echo "sending one file: " $filename \
    | rsync -rxW --timeout=20 --files-from=- --from0 /motion-images/ /valvonta-remote/

# i quess not
else
  echo "bad filename please see usage :D" 1>&2
  exit 1
  # there is no usage
fi