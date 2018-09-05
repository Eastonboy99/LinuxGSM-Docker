#!/bin/bash
## linuxgsm-docker base image entrypoint script
## execute LinuxGSM or arbitrary server commands at will
## by passing command

## Because of a limitation in LinuxGSM script it must be run from the directory
## It is installed in.
##
## If one wants to use a volume for the data directory, which is the home directory
## then we must keep a backup copy of the script on local drive
# if [ ! -e ~/linuxgsm.sh ]; then
#     echo "Initializing Linuxgsm User Script in New Volume"
#     cp /gameserver/linuxgsm.sh ./linuxgsm.sh
# fi

# wget -o /tmp/linuxgsm.sh https://raw.githubusercontent.com/GameServerManagers/LinuxGSM/master/linuxgsm.sh 

# current_version=$(cat /tmp/linuxgsm.sh | grep "version=")
# local_version=$(cat ./l4d2server | grep "version=")
# if [ current_version != local_version ]; then
#     echo "please run \"docker pull {image_name}\" to get the latest version of this container"

if [ ! -e ~/l4d2server ]; then
    echo "Initializing Gameserver in New Volume"
    mv /gameserver/* ./
    symlinks -c ./
fi
# with no command, just spawn a running container suitable for exec's
if [ $# = 0 ]; then
    # bash ./l4d2server start && tail -f /dev/null & 
    bash ./l4d2server start && tmux attach-session -t l4d2server
    
    
else
    # execute the command passed through docker
    ./l4d2server "$@"

    # if this command was a server start cmd
    # to get around LinuxGSM running everything in
    # tmux;
    # we attempt to attach to tmux to track the server
    # this keeps the container running
    # when invoked via docker run
    # but requires -it or at least -t
    tmux set -g status off && tmux attach 2> /dev/null
fi

exit 0