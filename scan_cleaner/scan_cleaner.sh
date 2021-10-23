#!/bin/bash

source utilities_settings.properties

current_time=$(date "+%Y/%m/%d %H:%M:%S")

echo "Moving to" $SCAN_CLEANER_DIR/$SCAN_CLEANER_FOLDER
cd $SCAN_CLEANER_DIR/$SCAN_CLEANER_FOLDER

# find $SCAN_CLEANER_FOLDER -type f \( -iname \*.pdf -o -iname \*.PDF \) > /dev/null 2>&1
ls -l $SCAN_CLEANER_LS

if [ $? -eq 0 ] 
then
	echo "Here is what I will cleanse:"
	find $SCAN_CLEANER_DIR/$SCAN_CLEANER_FOLDER -type f \( -iname \*.pdf -o -iname \*.PDF \) 
	echo "Clean? Press enter to continue, to abort CRTL+C."
	echo "" >> $LOG
	read a
	echo "Timestamp: " $current_time >> $LOG
	find $SCAN_CLEANER_DIR/$SCAN_CLEANER_FOLDER -type f \( -iname \*.pdf -o -iname \*.PDF \) -delete | printf The files have been deleted >> $LOG
	echo "" >> $LOG
	echo "Done"
else
	echo "There is nothing to clear, aborting now."
fi