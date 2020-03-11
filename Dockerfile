FROM openjdk:8-slim

WORKDIR /minecraft

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  wget && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*


RUN wget https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar

RUN echo "eula=true" > eula.txt

CMD [ "java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui" ]

EXPOSE 25565