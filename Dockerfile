FROM alpine:latest 
MAINTAINER Hannes de Jager <hannes.de.jager@gmail.com>

RUN apk add --update curl bash perl wget && rm -rf /var/cache/apk/* \
    && curl http://www.rfxn.com/downloads/maldetect-current.tar.gz | tar -xz \
    && DIR=$(find -iname 'maldet*' | awk -F '/' '{print $2}' | head -1) \
    && cd $DIR \
    && bash install.sh \
    && cd .. \
    && rm -rf $DIR
