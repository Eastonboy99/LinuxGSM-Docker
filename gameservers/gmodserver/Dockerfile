#
# LinuxGSM Dockerfile
#
# https://github.com/GameServerManagers/LinuxGSM-Docker
#

FROM lgsm-docker:latest
LABEL maintainer="LinuxGSM <me@Danielgibbs.co.uk>"

ENV DEBIAN_FRONTEND noninteractive

USER lgsm
WORKDIR /home/lgsm

# RUN mv /gameserver/linuxgsm.sh /home/lgsm

RUN bash ./linuxgsm.sh gmodserver install

RUN pwd && ls / && bash ./gmodserver auto-install

EXPOSE 27015/udp

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["bash","/entrypoint.sh" ]
