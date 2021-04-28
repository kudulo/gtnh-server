FROM openjdk:8-jre

RUN wget http://downloads.gtnewhorizons.com/ServerPacks/GTNewHorizonsServer-1.7.10-2.1.0.0.zip

RUN unzip GTNewHorizonsServer-1.7.10-2.1.0.0.zip -d /app

WORKDIR /app

VOLUME /app/config
VOLUME /app/server.properties

EXPOSE 25565/tcp

CMD ['startserver.sh']
