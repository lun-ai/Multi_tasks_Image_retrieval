import numpy as np
import caffe
#import subprocess

#subprocess.call('export GLOG_logtostderr=0')
#subprocess.call('export GLOG_log_dir=./')

# allow complete output of weights and biases
np.set_printoptions(threshold='nan')
caffe.set_device(1)
caffe.set_mode_gpu()

# define root path
root = '/home/cuiyan/lun/'
proto = root + 'DSH_learning/FASHION/train_vgg_model.prototxt'

# define caffemodel for training
caffe_train_model1 = root + 'DSH_learning/FASHION/fashion_test_iter_41646.caffemodel'
vgg_model = root + 'DSH_learning/FASHION/vgg_16_layers.caffemodel'
param_train_file = root + 'DSH_learning/data/fashion/Type/training.txt'
param_val_file = root + 'DSH_learning/data/fashion/Type/training.txt'

# define net
net = caffe.Net(proto, caffe_train_model3, caffe.TRAIN)

# train image
transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})
#transformer.set_channel_swap('data', (2,1,0))
#transformer.set_transpose('data', (2,0,1))
train_image = caffe.io.load_image(root + 'DSH_learning/data/fashion/Type/training/0_1640.jpg')
transformed_image = transformer.preprocess('data', train_image)
net.blobs['data'].reshape(224, 224, 3)
net.blobs['data'].data[...] = transformed_image
#net2 = caffe.Net(proto, caffe_model2, caffe.TRAIN)

net.forward()
#weight = net.params['fc7'][0].data
#for layer_name, blob in net.blobs.iteritems():
#    print layer_name + '\t' + str(blob.data)
output = net.blobs['fc8_'].data
#weight2 = net2.params['fc8_classification'][0].data
#bias = net.params['fc8_classification'][1].data

#print weight
print output
#print weight2
#print bias
