#!/bin/sh

###
# delete files older than 4 months
###

find /motion-images/ -type f -mtime +120 -not -path '*/\.*' -delete -print
#
# where
# -type specifies f, a file
# -mtime modified days, +NN greater than NN
# -not negate next filter, -path match path of a hidden file or folder
#
# hidden files are filtered out, because rsync

###
# reduce the amount of files from relatively old events
###

# this is done by removing all but the first file of every second

find /motion-images/ -type f -mtime +60 -not -path '*/\.*' -not -name '*-00.jpg' -delete -print
#
# where
# -not negate next filter, -name match name of first file of this timestamp
#