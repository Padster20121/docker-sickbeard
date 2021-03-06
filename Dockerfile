FROM padster2012/docker-base:latest
MAINTAINER Tim Haak <tim@haak.co>

ENV SICKBEARD_VERSION master

RUN apt-get -q update &&\
    apt-get install -qy --force-yes python-cheetah && \
    curl -L https://github.com/midgetspy/Sick-Beard/tarball/$SICKBEARD_VERSION -o sickbeard.tgz && \
    tar -xvf sickbeard.tgz -C /  &&\
    mv /midgetspy-Sick-Beard-* /sickbeard/ &&\
    rm  /sickbeard.tgz && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/config","/data"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 8084

CMD ["/start.sh"]
