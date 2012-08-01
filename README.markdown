# autogit

    A *very* simple shell script for automated git 'commit and push', which can be run from cron.
    
The basic idea is to just commit all changes files regularly no matter what, for example if you only have access via WebDAV or Dropbox. 
Intended use is on a (virtual) server or other always-on device which also hosts the files you want to edit, and you don't really care about commit messages.

For a more advanced implementation of automated commiting, intended to run on the device you edit the files on and trying to generate meaningful commit messages, try [flashbake](https://github.com/commandline/flashbake).

I use it to edit text files in my [Gitit Wiki Server](http://gitit.net) from my [Dropbox(d)](http://www.dropboxwiki.com/Using_Dropbox_CLI) folder, so I can edit the wiki without easy access to git (i.e. [Textastic](http://www.textasticapp.com) on iPad), but there are many more uses for it.

## Installation

I like to do   
    $ git clone https://github.com/eins78/autogit.git ~/Scripts/autogit
    $ sudo ln -s ~/Scripts/autogit/autogit.sh /usr/local/bin/autogit
    
