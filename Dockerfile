FROM fedora:latest
MAINTAINER Daniel Bosk <dbosk@kth.se>
LABEL se.bosk.daniel.shadow.version="$Id: 195d019752d8903254c72d4fa5dad084b78377db $"
LABEL se.bosk.daniel.shadow.url="https://github.com/dbosk/shadow.docker"
RUN dnf install -y \
  gcc gcc-c++ clang clang-devel llvm llvm-devel glib2 glib2-devel \
  igraph igraph-devel cmake make xz \
  python numpy scipy python-matplotlib python-networkx python-lxml \
  git dstat screen htop
RUN git clone https://github.com/shadow/shadow.git && \
  cd shadow && ./setup build && ./setup install && \
  echo "export PATH=${PATH}:~/.shadow/bin" >> ~/.bashrc
