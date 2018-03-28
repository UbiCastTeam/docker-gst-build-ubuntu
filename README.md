# docker-gst-build-ubuntu

Builds an ubuntu 16.04 based image with gstreamer master and openh264 support

## Building

```
docker build . -t gst-build-ubuntu
```

## Running

```
docker run -it gst-build-ubuntu /opt/gstreamer/gst-uninstalled.py gst-launch-1.0 videotestsrc ! fakesink
```
