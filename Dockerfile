FROM ubuntu:16.04
MAINTAINER Kordan Ou <kordan@hitripod.com>

# Set Environment Variables & Language Environment
ENV HOME /root
ENV GOPATH /root/go
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOPATH/bin:$GOROOT/bin

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

# Environment for Golang
RUN mkdir -p $GOPATH
RUN mkdir -p $GOPATH/bin
RUN mkdir -p $GOPATH/pkg
RUN mkdir -p $GOPATH/src

# Install Basic Packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential software-properties-common 
RUN apt-get install -y wget curl git zip unzip man ca-certificates vim tmux zsh

# Make go 1.5.3 from tarball
RUN wget --no-verbose https://storage.googleapis.com/golang/go1.5.3.linux-amd64.tar.gz
RUN tar -xvf go1.5.3.linux-amd64.tar.gz
RUN rm go1.5.3.linux-amd64.tar.gz
RUN mv go /usr/local

# Install Kordan's dotfiles
RUN wget -O - https://raw.githubusercontent.com/hitripod/dotfiles/master/install.sh | sh && chsh -s /bin/zsh

WORKDIR /root
CMD ["zsh"]
