# gtnh-server
---
This Repo has a Dockerfile that will make a minecraft server using Gregtech: New Horizons.
Mod Pack: [GT New Horizons](https://www.curseforge.com/minecraft/modpacks/gt-new-horizons)
Version: 2.3.0

## Usage
---
To run this open a terminal move to the folder the repo was copied into and run commands:
```bash
docker build -t gtnh-server .
```

After it is done building the image run:
```bash
docker run -d -p 25565:25565 --name gtnh-server gtnh-server
```

## dockerfile

You can change the version of the server using this URL
[http://downloads.gtnewhorizons.com/ServerPacks/](http://downloads.gtnewhorizons.com/ServerPacks/)

For example if you wanted to make a server with the version 2.3.3 you would change the dockerfile like this

```Dockerfile
FROM openjdk:8-jre

# Change version number here
#-----------------------------------------------------------------------V.V.V-----------
RUN wget http://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.3.3_Server.zip
# Change version number here
#-------------------------V.V.V-------------------
RUN unzip GT_New_Horizons_2.3.3_Server.zip -d /app

WORKDIR /app

# Copy the modified server.properties file to the container
COPY server.properties /app/server.properties

RUN chmod +x startserver.sh  # Grant executable permissions to the script

VOLUME /app/config

RUN sed -i 's/eula=false/eula=true/' /app/eula.txt  # Change the EULA value

EXPOSE 25565/tcp

CMD ["./startserver.sh"]  # Execute the script

```