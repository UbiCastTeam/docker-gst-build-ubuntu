#!/bin/bash
# Copyright 2017, Florent Thiery
apt-get install nasm
git clone https://github.com/cisco/openh264
cd openh264
make && make PREFIX="/usr" install
