#!/bin/sh
START_TIME=$(date +%s)

# Check if youtube-dl is available
type youtube-dl >/dev/null 2>&1
RC=$?
if [ "${RC}" -ne 0 ]
then
  echo "I require youtube-dl, installing it: pip install youtube-dl"
  apk add --no-cache ca-certificates ffmpeg openssl python3
  pip3 install youtube-dl
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

# Echo version
echo "Version of youtube-dl: $(youtube-dl --version)"

# Run the youtube-dl with the received arguments
echo "Will run the following command now:"
echo "youtube-dl $@"
youtube-dl "$@"
RC=$?

if [ "${RC}" != 0 ]
then
  echo ""
  echo "Attention, youtube-dl with error code ${RC}!"
fi

# Calculate run duration
FINISH_TIME=$(date +%s)
i=$((FINISH_TIME - START_TIME))
hrs=$((i/60/60))
min=$((i/60-(hrs*60)))
sec=$((i-((i/60)*60)))
timestamp=$(printf "%d:%02d:%02d" "${hrs}" "${min}" "${sec}")
echo "Run duration: ${timestamp}"
