# Multi-tasks-Image-retrieval

Caffe ：/home/cuiyan/lun/docomo_hashing/DSH/
Script Code ：/home/cuiyan/lun/docomo_hashing/DSH/scripts/docomo/
Docomo test Data ：/home/cuiyan/ting/Data/Docomo/cloth_data/
Docomo train Data: /home/cuiyan/lun/docomo_train_image_set/

There is a brief outline of repository (README.txt) located under the path - /home/cuiyan/lun/docomo_hashing 

1 Creating lmdb docomo training / testing data
- /home/cuiyan/lun/docomo_hashing/DSH/scripts/docomo/

 create_docomo_test_lmdb.sh           Create test lmdb data from 273634 image data
 create_pattern_lmdb.sh               Generate train/test/validation lmdb for pattern data
 create_color_lmdb.sh                 Generate train/test/validation lmdb for color data
 create_type_lmdb.sh                  Generate train/test/validation lmdb for type data
 make_mean.sh			                    prepare binaryproto mean from image dataset


2 Train network
- Please find train_*.sh finetune_*.sh under

/home/cuiyan/lun/docomo_hashing/DSH/TYPE/
/home/cuiyan/lun/docomo_hashing/DSH/PATTERN/
/home/cuiyan/lun/docomo_hashing/DSH/COLOR/

*Note: Logs and snapshots will be saved in each of the parent directories.


3 Extract binary features
- /home/cuiyan/lun/docomo_hashing/DSH/scripts/docomo/

	extract_code.sh / extract_finetune_code.sh   extract train data and labels binary code
	extract_code_docomo.sh                       extract 273634 test data binary code


4 Test network on partitions of data
- /home/cuiyan/lun/docomo_hashing/DSH/scripts/docomo/

	test_map.m          compute mean average precision on partition test set


5 Evaluate result of retrieval on docomo test dataset
- /home/cuiyan/lun/docomo_hashing/DSH/scripts/docomo/

	docomo_prepare.m		calculate hamming space distance from extract code
	docomo_get_retrieval.m	sort 273634 image based on hamming space distance
	docomo_test_map.m		evaluate mea average precision for top-N retrieval of 1000 queries
  
6 Repository Composition:
- model_prototxt
       - a number of neural network model prototxts for future usage and documentation.
	 These network includes simple self devised CNN, AlexNet, ResNet-50, VGG-16, ResNet-18
         and GoogLenet. 

- model_weight
       - caffemodels that are likely to be reused.
