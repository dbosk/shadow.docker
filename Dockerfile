FROM ubuntu:18.04
MAINTAINER Daniel Bosk <dbosk@kth.se>
LABEL se.bosk.daniel.shadow.version="$Id: 195d019752d8903254c72d4fa5dad084b78377db $"
LABEL se.bosk.daniel.shadow.url="https://github.com/dbosk/shadow.docker"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
  cmake \
  gcc \
  g++ \
  libc-dbg \
  libglib2.0-dev \
  libigraph-dev \
  make \
  python3 \
  python3-pyelftools \
  xz-utils \
  python3-numpy \
  python3-lxml \
  python3-matplotlib \
  python3-networkx \
  python3-scipy \
  dstat \
  git \
  htop \
  tmux screen \
  automake autoconf zlib1g-dev liblzma5 liblzma-dev
WORKDIR /shadow
RUN git clone https://github.com/shadow/shadow.git shadow-src && \
  cd shadow-src && \
  ./setup build && ./setup install && \
  echo "export PATH=${PATH}:~/.shadow/bin" >> ~/.bashrc && \
  echo "export PATH=${PATH}:/shadow/shadow-src/src/tools" >> ~/.bashrc
RUN git clone https://github.com/shadow/tgen.git tgen-src && \
  cd tgen-src && mkdir build && cd build && \
  cmake .. -DCMAKE_INSTALL_PREFIX=~/.shadow && \
  make && make install
