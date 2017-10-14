% Loading extracted features and query names
query273634 = importdata ('/home/cuiyan/ting/Data/Docomo/queryname273634.txt');
query1000 = importdata ('/home/cuiyan/ting/Data/Docomo/queryname1000.txt');
f_type=fopen('/home/cuiyan/lun/docomo_DSH/DSH_result/docomo/273634_test_retrieval/docomo273634type_code48.dat','rb');
f_pattern=fopen('/home/cuiyan/lun/docomo_DSH/DSH_result/docomo/273634_test_retrieval/docomo273634pattern_code48.dat','rb');
f_color=fopen('/home/cuiyan/lun/docomo_DSH/DSH_result/docomo/273634_test_retrieval/docomo273634color_code48.dat','rb');

% Read 48 bit binary hash code for 273634 image data
B_type=fread(f_type, [48,273634], 'float');
B_pattern=fread(f_pattern, [48,273634], 'float');
B_color=fread(f_color, [48,273634], 'float');
fclose(f_type);
fclose(f_pattern);
fclose(f_color);

% Initialize query index matrix and hash bit matrix
queryidx = zeros(1,1000);

% find indices of each of 1000 queries in 273634 data
% store found indices and 48 bit hash codes 
% of queries in queryidx and querybit
for i = 1 : 1000
    queryidx(i) = find(strcmp(query273634,query1000{i}));
end

% calculate hamming space distances
dis_type = calculate_distance(B_type, queryidx);
dis_pattern = calculate_distance(B_pattern, queryidx);
dis_color = calculate_distance(B_color, queryidx);

size(dis_type)
size(dis_pattern)
size(dis_color)

save('type_dis.mat', 'dis_type', '-v7.3');
save('pattern_dis.mat','dis_pattern', '-v7.3');
save('color_dis.mat','dis_color', '-v7.3');



