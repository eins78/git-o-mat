#!/bin/bash

# usage: autogit "/path/to/git/repository/"

GIT_PATH="$1"

# To set up set the above vars and:
# $ mkdir ~/Dropbox/"$WIKI"
# $ git clone "$GITIT_PATH"/"$WIKI"/"$DOCS_FOLDER" ~/Dropbox/"$WIKI"

# test
echo "$GIT_PATH"

# generate the message

MESSAGE_TMP="autogit_$(date +"%s")"
touch $MESSAGE_TMP
### generate main commit message (followed by 2 linebreaks)
echo -e "autocommit at $(date -u '+%FT%T+00:00') (UTC) by $USER on $HOSTNAME \n\n" >> $MESSAGE_TMP # fake RFC3339 date format as per http://stackoverflow.com/questions/11481115/bash-date-format-as-html5-datetime
### generate more messages (comment out lines to disable)
#### on OS X, ask iTunes for the current playing track
osascript -e 'tell application "System Events" to if ((name of processes) contains "iTunes") then do shell script ("osascript -e " & quoted form of ("tell application \"iTunes\" to if player state is playing then \"iTunes is playing: \" & name of current track & \" - \" & artist of current track" & ""))'

cd "$GIT_PATH"
git add --all

# only commit if neccessary (dirty check)
git status | grep "nothing to commit (working directory clean)" || git commit -F "$MESSAGE_TMP"

# push it to local or remote gitit wiki server
git push
