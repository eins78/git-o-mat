#!/bin/sh

# usage: autogit "/path/to/git/repository/"

GIT_PATH="$1"

cd "$GIT_PATH" && git pull && git add --all || exit 1

# only work if neccessary (dirty check)
git status | grep "nothing to commit (working directory clean)" && exit 0

# generate the message

MESSAGE_TMP="/tmp/autogit_$(date +"%s")"
touch $MESSAGE_TMP
### generate main commit message (followed by 2 linebreaks)
echo "autocommit at $(date -u '+%FT%T+00:00') (UTC) by $USER on $HOSTNAME \n\n" >> $MESSAGE_TMP # fake RFC3339 date format as per <stackoverflow.com/questions/11481115/bash-date-format-as-html5-datetime>

### generate more messages if there is a script for it in the repo

[[ -f ".papermill/message.sh" ]] && sh .papermill/message.sh >> $MESSAGE_TMP

echo "[#] Commiting to Git ..."
echo "    [:] Message:"
echo "$MESSAGE_TMP"
git commit -F "$MESSAGE_TMP" ## commit with $MESSAGE

git push ## push it to default git repo origin (local or remote)
