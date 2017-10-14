% Loading calculated database distance
query273634 = importdata ('/home/cuiyan/ting/Data/Docomo/queryname273634.txt');
dis_type = cell2mat(struct2cell(load('/home/cuiyan/lun/docomo_DSH/DSH_result/docomo/273634_test_retrieval/type_dis.mat')));
dis_pattern = cell2mat(struct2cell(load('/home/cuiyan/lun/docomo_DSH/DSH_result/docomo/273634_test_retrieval/pattern_dis.mat')));
dis_color = cell2mat(struct2cell(load('/home/cuiyan/lun/docomo_DSH/DSH_result/docomo/273634_test_retrieval/color_dis.mat')));

dis = 0.8 * dis_type + 0.1 * dis_pattern + 1.2 * dis_color;
[C, retrieval_idx] = sort(dis, 2, 'descend');


% Get top-1000 retrieval results' filenames
retrieval_names = cell(1000,1001);
for i=1:1000
    for j=1:1001
      retrieval_names(i,j) = query273634(retrieval_idx(i,j));
    end
end

fid = fopen('/home/cuiyan/ting/Data/Docomo/retrieval_names_1000.txt','wt');
for k = 1:1000
    a = retrieval_names(k);
    a = cell2mat(a);
    fprintf(fid,'%s\n', retrieval_names{k,:});
end
fclose(fid);
