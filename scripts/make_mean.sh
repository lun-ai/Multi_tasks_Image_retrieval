#!/usr/bin/env sh
# Compute the mean image from the pattern_train_lmdb

EXAMPLE=PATTERN
DATA=PATTERN
TOOLS=build/tools

$TOOLS/compute_image_mean $EXAMPLE/pattern_train_lmdb \
  $DATA/pattern_mean.binaryproto

echo "Done."
