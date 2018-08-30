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

# RUN mv /gameserver/linuxgsm.sh /home/lgsm

RUN bash ./linuxgsm.sh gmodserver

RUN bash ./gmodserver auto-install

EXPOSE 27015/udp

RUN chmod -R 775 /home/lgsm 
WORKDIR /home/lgsm/
# VOLUME [ "/home/lgsm" ]
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash","/entrypoint.sh" ]
