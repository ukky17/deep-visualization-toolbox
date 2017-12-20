import numpy as np
import pickle
import os
from glob import glob

import cv2

if __name__ == '__main__':
    filenames = glob('optimize_results/*.tiff')

    for file in filenames:
        img = cv2.imread(file)

        # gray scale
        img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

        # modify scale (227x227 -> 1024x1024)
        img = cv2.resize(img, (1024, 1024), interpolation=cv2.INTER_LINEAR)

        # crop center
        img = img[256:768, 256:768]

        # save
        cv2.imwrite('processed_images/proc_' + file[20: ], img)
