import pickle
import os
from glob import glob
from tqdm import tqdm

import numpy as np
from skimage import exposure
import cv2

size = (512, 512)

layers = ['conv1', 'conv2', 'conv3', 'conv4', 'conv5']
rf_size = [11, 51, 99, 131, 163] # calculated using RF_size.py

for i in tqdm(range(len(layers))):
    filenames = glob('optimize_results/opt_' + layers[i] + '_*.tiff')
    start_idx = int((227 - rf_size[i]) / 2)
    end_idx = int((227 + rf_size[i]) / 2)

    for file in filenames:
        img = cv2.imread(file)

        # gray scale
        img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

        # crop center
        img = img[start_idx: end_idx, start_idx: end_idx]

        # convert to float64
        img = img.astype('float64')

        # resize
        img = cv2.resize(img, size)

        # enhance contrast
        p_lower, p_upper = np.percentile(img, (1, 99))
        img_enhanced = exposure.rescale_intensity(img, in_range=(p_lower, p_upper)) * 255

        # adjust mean to 0
        # img -= np.mean(img)
        img_enhanced -= np.mean(img_enhanced)

        # add circular mask
        mask = np.zeros_like(img)
        mask = cv2.circle(mask, (size[0]//2, size[1]//2), size[0]//2, (255, 255, 255), -1)
        mask = cv2.GaussianBlur(mask, (23, 23), sigmaX=10) # mask.max()=255
        # img = img * mask / 255.0 + 128
        img_enhanced = img_enhanced * mask / 255.0 + 128

        # save
        cv2.imwrite('processed_images/proc_' + file[21: ], img_enhanced)
