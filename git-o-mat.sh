#!/bin/sh

# usage: git-o-mat "/path/to/git/repository/"

GIT_PATH="$1"

cd "$GIT_PATH" && git pull && git add --all || exit 1

# only work if neccessary (dirty check)
git status | grep "nothing to commit (working directory clean)" && exit 0

# generate the message

MESSAGE_TMP="/tmp/autogit_$(date +"%s")"
touch $MESSAGE_TMP

### check if local message generator exists in repo
[[ -f "scripts/commit-message.sh" ]] && { # IF IT EXISTS 

    # generate commit message from local script
    sh scripts/commit-message.sh >> $MESSAGE_TMP 

} || { # IF NOT EXISTS

    # generate default commit message (followed by 2 linebreaks)
    echo "autocommit at $(date -u '+%FT%T+00:00') (UTC) by $USER on $HOSTNAME \n\n" >> $MESSAGE_TMP # fake RFC3339 date format as per <stackoverflow.com/questions/11481115/bash-date-format-as-html5-datetime>
}

echo "[#] Commiting to Git ..."
echo "    [:] Message:"
echo "$MESSAGE_TMP"
git commit -F "$MESSAGE_TMP" ## commit with $MESSAGE

git push ## push it to default git repo origin (local or remote)
