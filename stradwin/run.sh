#COMMAND=/bin/bash

modles_dir="`pwd`/Models/"
mkdir -p "${modles_dir}"

socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
open -a Xquartz
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
echo $IP
xhost + $IP
#docker run --rm -it -e "DISPLAY=$IP:0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" --device /dev/dri --net=host --ipc=host --privileged stradwin
#docker run --rm -it -e "DISPLAY=$IP:0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" stradwin



docker run --rm -it -e "DISPLAY=$IP:0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" -v="`pwd`/Models/:/var/Models/:rw" stradwin

