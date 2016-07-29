FROM ubuntu:14.04

MAINTAINER Matt Titmus <matthew.titmus@gmail.com>

ENV MUD_VERSION 3.8.6
ENV MUD_DOWNLOAD_URL http://dead-souls.net/code/ds${MUD_VERSION}.zip 
ENV MUD_HOME /home/mud

RUN apt-get update \
    && apt-get -y install --no-install-recommends bison gcc libc6 libc6-dev make telnet wget unzip \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash mud 

USER mud

WORKDIR ${MUD_HOME}

RUN wget ${MUD_DOWNLOAD_URL} \
   && unzip ds${MUD_VERSION}.zip \
   && rm ds${MUD_VERSION}.zip

WORKDIR /home/mud/ds${MUD_VERSION}/fluffos-2.23-ds03 

RUN ./configure \
   && make install

EXPOSE 6666

WORKDIR /home/mud/ds${MUD_VERSION}/bin

# Lib directory is a volume, so configuration and build history can be persisted and survive restarts
VOLUME /home/mud/ds${MUD_VERSION}/lib

CMD ./driver /home/mud/ds${MUD_VERSION}/bin/mudos.cfg

