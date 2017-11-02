% Loop over all data sets
dataset = {'original_coefficients','Coefficients_normalized'};
for dataIndex = 1:numel(dataset)
    [~,~,a] = xlsread(fullfile('C:\Plots\TextureArticle\Heatmap','results_designs.xls'),dataset{dataIndex});
    
    variables = a(1,1:5:end);
    params = a(3:end,1);
    params2 = params;
    % Sort parameters manually
    ind2 = [2 1 10 3:9 12 11 13 14 30 23:29 22 15:21 43:49 31:42];
    
    % Add gnuplot specific labels
    for i = 1:numel(params)
        params2{i} = sprintf(' ''\\footnotesize %s'' %i,\\ ', params{ind2(i)},i-1);
    end
    
    % Remove euclidian distance'
    variables(end) = [];
    for i = 1:numel(variables)
        variables{i}(end-10:end) = [];
    end
    
    % Sort variables in alphabetical order
    [~, ind] = sort(variables);
    
    % Initialize map variable
    map.(dataset{dataIndex}) = zeros(numel(params),numel(variables));
    
    for i = 1:numel(variables)
        map.(dataset{dataIndex})(:,i) = cell2mat(a(3:end,3+5*(i-1)));
    end
    

    map.(dataset{dataIndex}) = map.(dataset{dataIndex})(ind2,ind);
    
    % Save data
    fid = fopen(sprintf('C:\\Plots\\TextureArticle\\Heatmap\\heatmap_%s.bin',dataset{dataIndex}),'w');
    fwrite(fid,map.(dataset{dataIndex}),'double');
    fclose(fid);
    0;
end