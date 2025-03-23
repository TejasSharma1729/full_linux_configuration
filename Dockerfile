# COMPLETE SETUP OF DOCKER ENVIRONMENT FOR C++, C, ASSEMBLY & QEMU WITH VIM
# Build with Rosetta. Then try working without.
FROM ubuntu:24.04

ENV TZ=Asia/Kolkata

RUN apt-get update && apt-get full-upgrade -y 

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install git
COPY .bashrc ~/.bashrc
COPY .vimrc ~/.vimrc
COPY config.sh ~/config.sh
COPY .pythonrc ~/.pythonrc
COPY .pythonstartup ~/.pythonstartup
RUN chmod +x ~/config.sh
RUN ~/config.sh

CMD ["/bin/bash"]
