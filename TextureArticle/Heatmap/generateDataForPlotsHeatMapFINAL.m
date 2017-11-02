% Loop over all data sets
% dataset = {'original_coefficients','Coefficients_normalized'};
dataset = {'MLRcoefficientsGliomaNormalized'};
for dataIndex = 1:numel(dataset)
    [~,~,a] = xlsread(fullfile('C:\Plots\TextureArticle\Heatmap','FINAL_design_five_factors_Median_NormalizedTextureResults.xls'),dataset{dataIndex});
    
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
    map.(dataset{dataIndex})    = zeros(numel(params),numel(variables));
    ci.(dataset{dataIndex})     = zeros(numel(params),numel(variables));
    tmpMap                      = zeros(numel(params),numel(variables));
    tmpCi                       = zeros(numel(params),numel(variables));
    
    for i = 1:numel(variables)
        tmpMap(:,i) = cell2mat(a(3:end,3+5*(i-1)));
        tmpCi(:,i) = cell2mat(a(3:end,4+5*(i-1)));
    end
    
    % Reoder data to new sorting
    map.(dataset{dataIndex}) = tmpMap(ind2,ind);
    ci.(dataset{dataIndex}) = tmpCi(ind2,ind);
    
    % Get significant datapoints
    [I,J] = ind2sub(size(map.(dataset{dataIndex})),find(abs(map.(dataset{dataIndex}))-2.575*ci.(dataset{dataIndex}) > 0));
        
    % Save data
    fid = fopen(sprintf('C:\\Plots\\TextureArticle\\Heatmap\\heatmap_%s.bin',dataset{dataIndex}),'w');
    fwrite(fid,map.(dataset{dataIndex}),'double');
    fclose(fid);
    
    dlmwrite(sprintf('C:\\Plots\\TextureArticle\\Heatmap\\significant_%s.dat',dataset{dataIndex}),[J-1 I-1]);
    0;
end