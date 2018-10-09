#!/bin/sh
# If the DOWNLOAD_TO_DATE_FOLDER variable is set to yes then a directory named as date&time is created and swtiched to this folder
if [ ! -z "${DOWNLOAD_TO_DATE_FOLDER}" ]
then
      if [ "${DOWNLOAD_TO_DATE_FOLDER}" == "yes" ]
      then
        DATE_VARIABLE=$(date '+%Y-%b-%d_%H:%M:%S')
	echo "Found 'DOWNLOAD_TO_DATE_FOLDER' variable set to 'yes'"
	echo "Download will started in the folder '${DATE_VARIABLE}'"
        mkdir -p "${DATE_VARIABLE}"
        cd "${DATE_VARIABLE}"
      fi
fi

# Run the youtube-dl whit the recieved aruments
youtube-dl "$@"
