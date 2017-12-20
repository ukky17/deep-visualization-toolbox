#!/usr/bin/env bash

# iterate
for i in `seq 0 255`
do
    ./optimize_image.py --push-layer conv2 --push-channel $i
done
