% Loading docomo 1-cosine retrieval top-1000 ranking & DSH retrieval top-1000 ranking 
docomoquery = importdata ('/home/cuiyan/ting/Data/Docomo/docomo1001000.txt');
myquerys = importdata ('/home/cuiyan/ting/Data/Docomo/retrieval_names_1000.txt');


% check for top-N retrieval result
N = 1000

docomo = cell(1000,1001);
myquery = cell(1000,1001);
k=1;

for i = 1:1000
   for j = 1:1001
      docomo{i,j} = docomoquery{k};
      myquery{i,j} = myquerys{k};
      k = k + 1;
    end
end


num=0;
for j = 1:1000
    for k = 2:N + 1
	  T  = strcmp({docomo{j,:}},{myquery{j,k}});
	  num = num + sum(T==1); 
    end
end

% print number of matching retrieval
num

top1000 = num/(1000*1000)


