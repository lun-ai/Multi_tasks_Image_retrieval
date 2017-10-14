#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

EXAMPLE=examples/imagenet
TOOLS=build/tools
DATA=/home/cuiyan/ting/Data/Docomo
TARGET=data_lmdb

TEST_DATA_ROOT=$DATA/cloth_data

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

if [ ! -d "$TEST_DATA_ROOT" ]; then
  echo "Error: TEST_DATA_ROOT is not a path to a directory: $TEST_DATA_ROOT"
  echo "Set the TEST_DATA_ROOT variable in create_*.sh to the path" \
       "where the testing data is stored."
  exit 1
fi

rm -rf $TARGET/docomo_test_lmdb

echo "Creating test lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
	--backend=lmdb \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    $TEST_DATA_ROOT \
    $DATA/cloth_data_lmdb.txt \
	$TARGET/docomo_test_lmdb \
	1

echo "Done."
