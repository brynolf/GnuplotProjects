[~,~,a] = xlsread(fullfile('C:\Plots\TextureArticle\Heatmap','Coefficients.XLS'),'Median coefficients');

variables = a(1,1:5:end);
params = a(3:end,1);

% Add gnuplot specific labels
for i = 1:numel(params)
    params{i} = sprintf(' ''%s'' %i,\\ ', params{i},i-1);
end

% Remove euclidian distance'
variables(end) = [];
for i = 1:numel(variables)
    variables{i}(end-10:end) = [];
end

% Initialize map variable
map = zeros(numel(params),numel(variables));

for i = 1:numel(variables)
    map(:,i) = cell2mat(a(3:end,3+5*(i-1)));
end

% Save data
fid = fopen(fullfile('C:\Plots\TextureArticle\Heatmap','heatmap.bin'),'w');
fwrite(fid,map,'double');
fclose(fid);