function dis = calculate_distance(extracted_code, queryidx)

% Initialize query index matrix and hash bit matrix
querybit = zeros(48,1000);

% find indices of each of 1000 queries in 273634 data
% store indices and 48 bit hash codes 
% of queries in the same order as in query1000.txt
for i = 1 : 1000
    querybit(:, i) = extracted_code(:, queryidx(i));
end

% calculate distances
% dis           dim = 1000 * 273634
% C             dim = 1000 * 273634
% retrieval_idx dim = 1000 * 273634
extracted_code_tmp = extracted_code;
extracted_code_tmp = sign(extracted_code_tmp); 
querybit = sign(querybit); 
dis = querybit' * extracted_code_tmp;

end