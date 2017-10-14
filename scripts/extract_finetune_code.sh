#!/usr/bin/env sh

rm ./FASHION/type_f24_code.dat
rm ./FASHION/type_f24_label.dat

./build/tools/extract_features_binary FASHION/fashion_vgg_f24_iter_50000.caffemodel FASHION/finetune_vgg_stage6.prototxt fc8_binary_Type_f24 FASHION/type_f24_code.dat 1000 0
./build/tools/extract_features_binary FASHION/fashion_vgg_f24_iter_50000.caffemodel FASHION/finetune_vgg_stage6.prototxt label FASHION/type_f24_label.dat 1000 0
