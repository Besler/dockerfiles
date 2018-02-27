# Description:
#	Docker file to run Stradwin on a Mac. See http://mi.eng.cam.ac.uk/~rwp/stradwin/
#
# History:
#	2017.10.23	Besler	Created
#
# Notes:
#	- If Stradwin is updated, you may have to go grab the path yourself.

# Base docker image is Ubuntu 16.04
FROM ubuntu:16.04
MAINTAINER Bryce Besler

# Stradwin file locations
ENV STRADWIN_FILE stradwin5.3_for_linux_64bit.tar.gz
ENV STRADWIN_URL http://mi.eng.cam.ac.uk/~rwp/stradwin/${STRADWIN_FILE}

# Setup environment
ENV LIBGL_DEBUG=verbose
ENV DEBIAN_FRONTEND noninteractive

# Install and update libraries
RUN apt-get update -y && apt-get install -y apt-transport-https
RUN apt-get install -y apt-utils
RUN apt-get install -y libwxgtk3.0
RUN apt-get install -y wget
RUN apt-get install -y v4l-utils
RUN apt-get install -y mesa-utils
RUN apt-get install -y libglu1-mesa
RUN apt-get install -y xserver-xorg-video-all

# Create directory to map files
RUN mkdir -p /var/Models/

# Install Stradwin
RUN mkdir -p /opt/stradwin/
RUN wget $STRADWIN_URL
RUN tar -xvzf $STRADWIN_FILE -C /opt/stradwin/

# Run and setup
CMD [ "/bin/bash", "/opt/stradwin/stradwin5.3_for_linux_64bit/stradwin" ]
CMD [ "/opt/stradwin/stradwin5.3_for_linux_64bit/stradwin_x86-64" ]
#ENTRYPOINT [ "/opt/stradwin/stradwin5.3_for_linux_64bit/stradwin" ]
#CMD [ "/bin/bash" ]

# Test program
#CMD [ "glxgears" ]

