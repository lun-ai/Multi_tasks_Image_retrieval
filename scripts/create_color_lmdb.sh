#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

EXAMPLE=examples/imagenet
TOOLS=build/tools
DATA=/home/cuiyan/lun/docomo_train_image_set/Color
TARGET=data_lmdb

TRAIN_DATA_ROOT=$DATA/training/
VAL_DATA_ROOT=$DATA/validation/
TEST_DATA_ROOT=$DATA/testing/

# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=224
  RESIZE_WIDTH=224
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet validation data is stored."
  exit 1
fi

if [ ! -d "$TEST_DATA_ROOT" ]; then
  echo "Error: TEST_DATA_ROOT is not a path to a directory: $TEST_DATA_ROOT"
  echo "Set the TEST_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet testing data is stored."
  exit 1
fi

rm -rf $TARGET/color_train_lmdb
rm -rf $TARGET/color_val_lmdb
rm -rf $TARGET/color_test_lmdb

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
	--backend=lmdb \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $DATA/training.txt \
    $TARGET/color_train_lmdb \
	1

echo "Creating val lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
	--backend=lmdb \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $VAL_DATA_ROOT \
    $DATA/validation.txt \
	$TARGET/color_val_lmdb \
	1

echo "Creating test lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
	--backend=lmdb \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $TEST_DATA_ROOT \
    $DATA/testing.txt \
	$TARGET/color_test_lmdb \
	1

echo "Done."
