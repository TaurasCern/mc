#!/bin/sh

screen -dmS minecraft java -Xmx6G -Xms6G -jar /minecraft/fabric-server-launch.jar nogui

# wait for the server to start, otherwise container logs will be empty
sleep 5

tail -f /minecraft/logs/latest.log