# Hints

So what do the options mean / do in the README?

```
   -v $HOME/Downloads:/opt/proxmark3/Data \   // Map downloads on to the data 
					      // directory to save data
```

```
   -e DISPLAY=$DISPLAY \
   -v /tmp/.X11-unix:/tmp/.X11-unix \	      // These 2 options allow 
					      // hw tune to display properly
```

```
   -v /dev:/dev \			      // Shares all the devices.
```

```
   -v /run/udev:/run/udev:ro \		      // Allows udev to have 
					      // extended info

```
