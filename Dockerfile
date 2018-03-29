FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONPATH=/usr/lib/python3.5/site-packages/

RUN sed -i '/^#\sdeb-src /s/^#//' "/etc/apt/sources.list"

# We are getting openh264 and fdk from https://launchpad.net/~djcj/+archive/ubuntu/tools
RUN apt-get update && apt-get install -q -y software-properties-common python-software-properties && add-apt-repository -y ppa:djcj/tools && apt-get update

RUN apt-get update && apt-get -q -y build-dep gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-vaapi && apt-get install -q -y git ninja-build python3-pip flex bison python-gobject-dev libfdk-aac-dev libfdk-aac0 i965-va-driver && pip3 install meson --prefix /usr/

WORKDIR /root
ADD . /root

RUN apt-get install libopenh264-3 libopenh264-dev
# if you prefer to compile openh264 from git
# RUN /root/openh264-build.sh
RUN /root/gst-build.sh
