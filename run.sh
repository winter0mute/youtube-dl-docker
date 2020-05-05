#!/bin/sh
START_TIME=$(date +%s)

# Check if first run as root, if yes then tryig to upgrade youtube-dl
if [ -f /firstrun_placeholder -a "$(id -u)" = "0" ]
then
  echo "Detecting first run as root, trying to upgrade youtube-dl: pip3 install --upgrade youtube-dl"
  pip3 install --upgrade youtube-dl
  echo "Upgrade complete!"
  echo -n "Removeing first run placeholder file..."
  rm /firstrun_placeholder
  echo "done!"
fi

# If the DOWNLOAD_TO_DATE_FOLDER variable is set to yes then a directory named as date&time is created and swtiched to this folder
if [ ! -z "${DOWNLOAD_TO_DATE_FOLDER}" ]
then
      if [ "${DOWNLOAD_TO_DATE_FOLDER}" == "yes" ]
      then
        DATE_VARIABLE=$(date '+%Y-%b-%d_%H:%M:%S')
	echo "Found 'DOWNLOAD_TO_DATE_FOLDER' variable set to 'yes'"
	echo "Download will be started in folder '${DATE_VARIABLE}'"
        mkdir -p "${DATE_VARIABLE}"
        cd "${DATE_VARIABLE}"
      fi
fi

# Echo versions
echo "Version of Alpine Linux: $(cat /etc/alpine-release)"
echo "Version of youtube-dl: $(youtube-dl --version)"

# Run the youtube-dl with the received arguments
echo "Will run the following command now:"
echo "youtube-dl $@"
youtube-dl "$@"
RC=$?

echo ""
if [ "${RC}" != 0 ]
then
  echo "Attention, youtube-dl with error code ${RC}!"
else
  echo "Download ended successfully!"
fi

# Calculate run duration
FINISH_TIME=$(date +%s)
i=$((FINISH_TIME - START_TIME))
hrs=$((i/60/60))
min=$((i/60-(hrs*60)))
sec=$((i-((i/60)*60)))
timestamp=$(printf "%d:%02d:%02d" "${hrs}" "${min}" "${sec}")
echo "Run duration: ${timestamp}"
