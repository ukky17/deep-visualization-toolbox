# Feature images for every channel of conv2 layer
Images were optimized by activation maximization.

Model: Caffenet (slightly modified from Alexnet)
Algorithm: Deep visualization toolbox (https://github.com/yosinski/deep-visualization-toolbox)

# Optimization hyper-parameters
## regularization
decay=0.0001, blur-radius=1.0, blur-every=4,
small-val-percentile=0, small-norm-percentile=0, px-benefit-percentile=0, px-abs-benefit-percentile=0

## optimizer
lr-policy='constant', lr-params=100, max-iter=100

# processing
see `processing.py`

# Reference
@inproceedings{yosinski-2015-ICML-DL-understanding-neural-networks,
Author = {Jason Yosinski and Jeff Clune and Anh Nguyen and Thomas Fuchs and Hod Lipson},
Booktitle = {Deep Learning Workshop, International Conference on Machine Learning (ICML)},
Title = {Understanding Neural Networks Through Deep Visualization},
Year = {2015}}
