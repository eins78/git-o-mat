#!/bin/sh

GITIT_PATH="/home/gitit"
DOCS_FOLDER="Docs"
WIKI="178"

DROPBOX_WIKI_PATH="/home/eins78/Dropbox/TEXT/txt.178.is"

# To set up set the above vars and:
# $ mkdir ~/Dropbox/"$WIKI"
# $ git clone "$GITIT_PATH"/"$WIKI"/"$DOCS_FOLDER" ~/Dropbox/"$WIKI"

cd "$DROPBOX_WIKI_PATH"
git add --all

# only commit if neccessary (dirty check)
git status | grep "nothing to commit (working directory clean)" || git commit -m "autocommit at $(date --rfc-3339=ns) by $USER on $HOSTNAME"

# push it to local or remote gitit wiki server
git push
