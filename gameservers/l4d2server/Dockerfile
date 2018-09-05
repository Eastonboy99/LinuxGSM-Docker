#
# LinuxGSM Dockerfile
#
# https://github.com/GameServerManagers/LinuxGSM-Docker
#

FROM lgsm-docker:latest
LABEL maintainer="LinuxGSM <me@Danielgibbs.co.uk>"

ENV DEBIAN_FRONTEND noninteractive

USER lgsm
WORKDIR /gameserver/

## download gmodserver file
RUN bash ./linuxgsm.sh l4d2server

## install the server to /gameserver
RUN bash ./l4d2server auto-install

## needed for gmodserver
EXPOSE 27015/udp

## make sure permissions are set (775 so that the container and the host can access the files)
RUN chmod -R 775 /home/lgsm 
RUN chmod -R 775 /gameserver 

WORKDIR /home/lgsm/



COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash","/entrypoint.sh" ]
