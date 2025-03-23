# COMPLETE SETUP OF DOCKER ENVIRONMENT FOR C++, C, ASSEMBLY & QEMU WITH VIM
# Build with Rosetta. Then try working without.
FROM ubuntu:24.04

ENV TZ=Asia/Kolkata

RUN apt-get update && apt-get full-upgrade -y 

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install git
RUN git clone 

CMD ["/bin/bash"]
