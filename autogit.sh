#!/bin/sh

# usage: autogit "/path/to/git/repository/"

GIT_PATH="$1"

# To set up set the above vars and:
# $ mkdir ~/Dropbox/"$WIKI"
# $ git clone "$GITIT_PATH"/"$WIKI"/"$DOCS_FOLDER" ~/Dropbox/"$WIKI"

# test
echo "$GIT_PATH"

cd "$GIT_PATH"
git add --all

# only commit if neccessary (dirty check)
git status | grep "nothing to commit (working directory clean)" || git commit -m "autocommit at $(date --rfc-3339=ns) by $USER on $HOSTNAME"

# push it to local or remote gitit wiki server
git push
