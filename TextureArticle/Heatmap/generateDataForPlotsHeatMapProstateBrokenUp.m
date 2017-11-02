% Loop over all data sets
dataset = {'MLRcoefficientsProstNormalized'};
for dataIndex = 1:numel(dataset)
    [~,~,a] = xlsread(fullfile('C:\Plots\TextureArticle\Heatmap','FINAL_design_four_factors_Median_Prostate_NormalizedTextureResultsProstate.xls'),dataset{dataIndex});
    
    variables = a(1,1:5:end);
    params = a(3:end,1);
    params2 = params;
    % Sort parameters manually
    ind2 = [2 1 6 3:5 8 7 9 10 18 15:17 14 11:13 19:21];
    
    sections = {'Block1','Block2','Block3','Block4','Block5';...
                1:3,4:11,12:15,16:18,19:21};
    
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
    
    % Loop over all sections
    
    for sects = 1:size(sections,2)
        % Save data
        fid = fopen(sprintf('C:\\Plots\\TextureArticle\\Heatmap\\heatmap_%s_Prost_%s.bin',dataset{dataIndex},sections{1,sects}),'w');
        fwrite(fid,map.(dataset{dataIndex})(sections{2,sects},:),'double');
        fclose(fid);
        tmpI = I(I>= min(sections{2,sects}) & I<= max(sections{2,sects}));
        tmpJ = J(I>= min(sections{2,sects}) & I<= max(sections{2,sects}));
        dlmwrite(sprintf('C:\\Plots\\TextureArticle\\Heatmap\\significant_%s_Prost_%s.dat',dataset{dataIndex},sections{1,sects}),[tmpJ-1 tmpI-min(sections{2,sects})]);
    end
    
    0;
end