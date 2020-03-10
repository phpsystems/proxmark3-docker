# proxmark3-docker

Docker Container for the RFID Research fork of the proxmark3 software.

When I run this container, the options I use are:

docker run -it --rm \
--privileged \
-e DISPLAY=$DISPLAY \
-v $HOME/Downloads:/opt/proxmark3/Data \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /dev:/dev \
--name proxmark3 \
proxmark3:latest


or when I get around to docker hub:

docker run -it --rm \
--privileged \
-e DISPLAY=$DISPLAY \
-v $HOME/Downloads:/opt/proxmark3/Data \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /dev:/dev \
--name proxmark3 \
phpsystems/proxmark3:2.0.0


