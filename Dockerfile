FROM openjdk:8-jre

RUN wget http://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.3.0_Server.zip

RUN unzip GT_New_Horizons_2.3.0_Server.zip -d /app

WORKDIR /app

# Copy the modified server.properties file to the container
COPY server.properties /app/server.properties

RUN chmod +x startserver.sh  # Grant executable permissions to the script

VOLUME /app/config

RUN sed -i 's/eula=false/eula=true/' /app/eula.txt  # Change the EULA value

EXPOSE 25565/tcp

CMD ["./startserver.sh"]  # Execute the script
