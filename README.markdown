# git-o-mat

    A *very* simple shell script for automated git 'commit and push', which can be run from cron.
    
The basic idea is to just commit all changes files regularly no matter what, for example if you only have access via WebDAV or Dropbox. 
Intended use is on a (virtual) server or other always-on device which also hosts the files you want to edit, and you don't really care about commit messages.

For a more advanced implementation of automated commiting, intended to run on the device you edit the files on and trying to generate meaningful commit messages, try [flashbake](https://github.com/commandline/flashbake).

I use it to edit text files in my [Gitit Wiki Server](http://gitit.net) from my [Dropbox(d)](http://www.dropboxwiki.com/Using_Dropbox_CLI) folder, so I can edit the wiki without easy access to git (i.e. [Textastic](http://www.textasticapp.com) on iPad), but there are many more uses for it.

## Installation

I like to do:

    git clone https://github.com/eins78/git-o-mat.git ~/.scripts/git-o-mat
    sudo ln -s ~/.scripts/git-o-mat/git-o-mat.sh /usr/local/bin/git-o-mat
    
Then run the script from cron every minute. 

    crontab -e

    */1 * * * * /usr/local/bin/git-o-mat "/path/to/git/repo"

On OS X, you can edit the file `is.178.git-o-mat.plist` and the copy it to `~/Libray/LaunchAgents/`.

It will commit only what you actually save with your text editor, so it won't be really 1 commit per minute. But the short intervall makes it more likely to catch renamed files, which happens automatically with git if the content is not also modified since the last commit.

To make it work with a [GitIt Wiki] in a Dropbox folder (on a remote server) I did:

    mkdir ~/Dropbox/"$WIKI"
    git clone "$GITIT_PATH"/"$WIKI"/"$DOCS_FOLDER" ~/Dropbox/"$WIKI"

But since the script just does "`git push`" it should work with whatever default remote you defined. (So by not setting a default remote you can disable pushing per repository.

## TODO

- fail/show help on empty argument
- accept a list and do it ``for`` all paths
