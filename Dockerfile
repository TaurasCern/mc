FROM --platform=arm64 bellsoft/liberica-openjdk-alpine:17.0.11

RUN apk add --no-cache screen

WORKDIR /minecraft

COPY fabric-installer-*.jar .

RUN java -jar fabric-installer-*.jar server -mcversion 1.20.1 -downloadMinecraft

COPY start.sh .
RUN chmod +x start.sh

COPY mods /minecraft/mods
COPY server.properties /minecraft/server.properties
# ensure log file creation before starting the server so docker could attach to it
COPY latest.log /minecraft/logs/latest.log 

RUN echo "eula=true" > eula.txt

EXPOSE 27015
EXPOSE 24454

ENTRYPOINT ["./start.sh"]