FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONPATH=/usr/lib/python3.5/site-packages/

RUN sed -i '/^#\sdeb-src /s/^#//' "/etc/apt/sources.list"
RUN apt-get update && apt-get -q -y build-dep gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad && apt-get install -q -y git ninja-build software-properties-common python-software-properties nasm sudo python3-pip flex bison python-gobject-dev && pip3 install meson --prefix /usr/

WORKDIR /root
ADD . /root
RUN /root/openh264-build.sh
RUN /root/gst-build.sh
