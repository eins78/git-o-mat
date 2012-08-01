# autogit

    A *very* simple shell script for automated git 'commit and push', which can be run from cron.
    
The intended use is on a (virtual) server or other always-on device which also hosts the files you want to edit, and you don't really care about commit messages.
For a more advanced implementation of automated commiting, intended to run on the device you edit the files on and trying to generate meaningful commit messages, try [flashbake](https://github.com/commandline/flashbake).
I use it to edit text files in my [Gitit Wiki Server](http://gitit.net) from my [Dropbox(d)](http://www.dropboxwiki.com/Using_Dropbox_CLI) folder, but there are many more uses for it.
