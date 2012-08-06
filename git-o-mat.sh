#!/bin/bash

# usage: autogit "/path/to/git/repository/"

GIT_PATH="$1"

cd "$GIT_PATH" && git pull && git add --all

# generate the message

MESSAGE_TMP="/tmp/autogit_$(date +"%s")"
touch $MESSAGE_TMP
### generate main commit message (followed by 2 linebreaks)
echo -e "autocommit at $(date -u '+%FT%T+00:00') (UTC) by $USER on $HOSTNAME \n\n" >> $MESSAGE_TMP # fake RFC3339 date format as per http://stackoverflow.com/questions/11481115/bash-date-format-as-html5-datetime
### generate more messages (comment out lines to disable)
#### on OS X, ask iTunes for the current playing track
osascript -e 'tell application "System Events" to if ((name of processes) contains "iTunes") then do shell script ("osascript -e " & quoted form of ("tell application \"iTunes\" to if player state is playing then \"iTunes is playing: \" & name of current track & \" - \" & artist of current track" & ""))'  >> $MESSAGE_TMP

# only commit if neccessary (dirty check) -- exit if not so no push
git status | grep "nothing to commit (working directory clean)" >/dev/null && exit 0 || git commit -F "$MESSAGE_TMP" >/dev/null 

# push it to default git repo origin (local or remote)
git push >/dev/null 
