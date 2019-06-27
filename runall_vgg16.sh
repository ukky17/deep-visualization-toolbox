#!/usr/bin/env bash

# prepare settings_local.py
cp models/vgg16/settings_local.vgg16.py settings_local.py

# iterate
for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv1_1 --push-channel $i --push-spatial 112 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv1_2 --push-channel $i --push-spatial 112 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv2_1 --push-channel $i --push-spatial 56 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv2_2 --push-channel $i --push-spatial 56 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv3_1 --push-channel $i --push-spatial 27 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv3_2 --push-channel $i --push-spatial 27 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv3_3 --push-channel $i --push-spatial 27 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv4_1 --push-channel $i --push-spatial 14 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv4_2 --push-channel $i --push-spatial 14 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv4_3 --push-channel $i --push-spatial 14 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv5_1 --push-channel $i --push-spatial 7 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv5_2 --push-channel $i --push-spatial 7 --data-size 224
done

for i in `seq 0 49`
do
    ./optimize_image.py --push-layer conv5_3 --push-channel $i --push-spatial 7 --data-size 224
done