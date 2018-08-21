#
# LinuxGSM Dockerfile
#
# https://github.com/GameServerManagers/LinuxGSM-Docker
#

FROM lgsm-docker:latest
LABEL maintainer="LinuxGSM <me@Danielgibbs.co.uk>"

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /gameserver

RUN bash /gameserver/linuxgsm.sh gmodserver

RUN bash ./gmodserver auto-install

WORKDIR /home/lgsm

EXPOSE 27015/udp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash","/entrypoint.sh" ]
