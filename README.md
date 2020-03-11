# proxmark3-docker

Docker Container for the RFID Research fork of the proxmark3 software.

When I run this container locally, the options I use are:

```
# docker build -t proxmark3 .

# docker run -it --rm \
   --privileged \
   -e DISPLAY=$DISPLAY \
   -v $HOME/Downloads:/opt/proxmark3/Data \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v /dev:/dev \
   --name proxmark3 \
   proxmark3
```

or when I get around to docker hub:
```
# docker run -it --rm \
   --privileged \
   -e DISPLAY=$DISPLAY \
   -v $HOME/Downloads:/opt/proxmark3/Data \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v /dev:/dev \
   --name proxmark3 \
   secopsconsult/proxmark3
```

