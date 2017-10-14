#!/usr/bin/env sh

rm ./PATTERN/compact_code24.dat

./build/tools/extract_features_binary_compact PATTERN/extra/pattern_stage5_vgg_f24_iter_40000.caffemodel PATTERN/finetune_vgg_stage5.prototxt fc_binary_Pattern_f24,fc8_binary_Type PATTERN/compact_code24.dat 1 0
