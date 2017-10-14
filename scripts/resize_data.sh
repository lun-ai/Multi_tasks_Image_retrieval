#!/usr/bin/env sh


for name in ~/lun/fashion_image_dataset/Type/validation/*.jpg;do
	echo "$name"
	convert -resize 224x224\! $name $name
done
echo "Done resizing images!"
