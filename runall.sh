#!/usr/bin/env bash

# iterate
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

for i in `seq 0 95`
do
    ./optimize_image.py --push-layer conv1 --push-channel $i --push-spatial 27
done
