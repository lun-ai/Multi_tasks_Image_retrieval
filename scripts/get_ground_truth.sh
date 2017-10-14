#!/bin/bash

dest="/home/cuiyan/lun/docomo_DSH/DSH/TYPE/groundtruth_pic";
src="/home/cuiyan/ting/Data/Docomo/cloth_data";

while read path; do 
   target=$(basename "$path"); 
   c=""; 
   while [[ -e "$dest"/"$target"$c ]]; do 
    echo "$target exists"; 
    let c++; 
    target="$target"$c; 
   done; 
   cp "$src"/"$path" "$dest"/"$target"; 
done