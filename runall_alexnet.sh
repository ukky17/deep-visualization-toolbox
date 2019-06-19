#!/usr/bin/env bash

# prepare settings_local.py
cp models/caffenet-yos/settings_local.template-caffenet-yos.py settings_local.py

# iterate
for i in `seq 0 95`
do
    ./optimize_image.py --push-layer conv1 --push-channel $i --push-spatial 27
done

for i in `seq 0 255`
do
    ./optimize_image.py --push-layer conv2 --push-channel $i --push-spatial 13
done

for i in `seq 0 383`
do
    ./optimize_image.py --push-layer conv3 --push-channel $i --push-spatial 6
done

for i in `seq 0 383`
do
    ./optimize_image.py --push-layer conv4 --push-channel $i --push-spatial 6
done

for i in `seq 0 255`
do
    ./optimize_image.py --push-layer conv5 --push-channel $i --push-spatial 6
done
