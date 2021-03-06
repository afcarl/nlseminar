#!/bin/sh

# Set working, storage, and seminar-data directories
SEMINAR_HOME=/nfs/blue/ghazvini/nl_seminar/nlseminar
SEMINAR_LIVE=/nfs/web/isi.edu/htdocs/division3/natural-language/nl-seminar/
#SEMINAR_LIVE=/nfs/isd/xingshi/workspace/temp/nlseminar/htdocs/
BACKUP=$SEMINAR_HOME/backup
DATA=$SEMINAR_HOME/data

# Set output filenames
WEBSITE=$SEMINAR_HOME/index.php
CALENDAR=$SEMINAR_HOME/nl.ics

# BACKUP
cp $SEMINAR_HOME/index.php $SEMINAR_HOME/nl.ics $BACKUP

# GENERATE DATE
python $SEMINAR_HOME/seminar.py --data $DATA \
                                        --website $WEBSITE \
                                        --ical $CALENDAR \
                                        --nomail

# COPY TO LIVE LOCATION
cp $WEBSITE $CALENDAR $SEMINAR_LIVE/
