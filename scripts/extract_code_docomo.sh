#!/usr/bin/env sh

#rm ./FASHION/docomo273634code.dat

./build/tools/extract_features_binary COLOR/extra/color_alexnet_f48_iter_30000.caffemodel COLOR/finetune_alexnet_model.prototxt fc_binary_Color_f48 FASHION/docomo273634color_code48.dat 273634 0
