#!/usr/bin/env sh

rm ./FASHION/type_code12.dat
rm ./FASHION/type_label12.dat

./build/tools/extract_features_binary FASHION/fashion_vgg_iter_55000.caffemodel FASHION/train_vgg_model.prototxt fc_binary_Pattern FASHION/type_code12.dat 100 0
./build/tools/extract_features_binary FASHION/fashion_vgg_iter_55000.caffemodel FASHION/train_vgg_model.prototxt label FASHION/type_label12.dat 100 0
