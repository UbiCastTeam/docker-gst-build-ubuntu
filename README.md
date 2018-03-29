# docker-gst-build-ubuntu

Builds an ubuntu 16.04 based image with gstreamer master and openh264 support; it supports vaapi hardware acceleration for Intel hardware.

## Building

```
docker build . -t gst-build-ubuntu
```

## Running

```
docker run -it gst-build-ubuntu /opt/gstreamer/gst-uninstalled.py gst-launch-1.0 --version
0:00:00.973797182    29       0xf8f920 ERROR                default gstvaapi.c:254:plugin_init: Cannot create a VA display

** (gst-plugin-scanner:29): CRITICAL **: gi.repository.Gst is no dict
gst-launch-1.0 version 1.15.0
GStreamer 1.15.0 (GIT)
Unknown package origin
```

```
docker run -it gst-build-ubuntu /opt/gstreamer/gst-uninstalled.py gst-launch-1.0 videotestsrc ! fakesink
```

## Running with hardware acceleration

NB: this requires intel hardware and host support (i965-va-driver)

```
docker run --privileged -v /dev:/dev -it gst-build-ubuntu /opt/gstreamer/gst-uninstalled.py gst-launch-1.0 videotestsrc num-buffers=30 ! vaapih264enc ! fakesink silent=false -v
```
