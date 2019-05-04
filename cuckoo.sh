#!/bin/bash
# Author: Avash Mulmi <avasz@protonmail.com>
# Fun script to create music player in telegram with telegram channel
# This downloads songs from youtube, extracts audio and uploads it to a telegram channel.
# Required: youtube-dl, telegram bot and bot ID, telegram channel or group and its ID
# Comes without any warranty, you are responsible for any damage this script may cause... 
# License: WTFPL  <http://www.wtfpl.net/>

chat_id=""
bot_token=""

YOUTUBEDL="/usr/local/bin/youtube-dl"
echo "Downloading song info...."

INFO=`$YOUTUBEDL --get-filename -o '%(title)s:%(alt_title)s:%(artist)s:%(genre)s:%(album)s:%(track)s:%(uploader)s:%(creator)s:%(channel)s:%(duration)s' $1`
echo $INFO

title=$(echo $INFO | cut -f 1 -d":" | sed  "s/ /_/g")
alt_title=$(echo $INFO | cut -f 2 -d":")
performer=$(echo $INFO | cut -f 3 -d":")
genre=$(echo $INFO | cut -f 4 -d":")
album=$(echo $INFO | cut -f 5 -d":")
track=$(echo $INFO | cut -f 6 -d":")
uploader=$(echo $INFO | cut -f 7 -d":")
duration=$(echo $INFO | cut -f 10 -d":")

echo "Downloading music...."
$YOUTUBEDL -x --audio-format mp3 -o /tmp/$title."%(ext)s" --write-thumbnail $1

echo "Uploading to telegram..."
curl -X POST https://api.telegram.org/bot$bot_token/sendAudio -F chat_id="$chat_id" -F thumb="@/tmp/$title.jpg" -F audio="@/tmp/$title.mp3" -F caption="$title" -F title="$title" -F performer="$performer" -F duration="$duration"


echo -e "\n\nUpload done"
echo "Cleaning files from temporary directory..."
rm /tmp/$title.{mp3,jpg}
echo "Completed..."
