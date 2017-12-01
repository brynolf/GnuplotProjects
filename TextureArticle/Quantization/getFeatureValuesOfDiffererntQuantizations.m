% Connect to database
ResultconnStr = 'Data Source=m313835\PATRIK; Initial Catalog=textureValidation; User Id=Patrik; Password=Patrik';
handles.textureValidation = DatabaseHandler(ResultconnStr);
tableNames = {'TextureResultsFinal'};
% colNames = handles.textureValidation.GetTableColsNames(tableName{1});

method = {'AutoROI','AutoSlice','manual'};

for i = 1:numel(method)
    query = sprintf(['SELECT [autoCorrelation]'...
        ',[clusterProminence]'...
        ',[clusterShade]'...
        ',[contrast]'...
        ',[correlation]'...
        ',[differenceEntropy]'...
        ',[differenceVariance]'...
        ',[dissimilarity]'...
        ',[energy]'...
        ',[entropy]'...
        ',[homogeneity]'...
        ',[infMeasCorr1]'...
        ',[infMeasCorr2]'...
        ',[inverseDifference]'...
        ',[maxProbability]'...
        ',[sumAverage]'...
        ',[sumEntropy]'...
        ',[sumOfSquares]'...
        ',[sumVariance] '...
        'FROM [textureValidation].[dbo].[textureResultsFinal] where GLCMLimitsMethod like ''%s'' and ADCMethod like ''linear[_]b0[_]1000'' and ImageXSize = 192 and ImageYSize = 192 and GLCMResolution = 32 and AddedNoiseStd = 0'],method{i});
    tmp = handles.textureValidation.SqlQuery(query);
    tmp = dataset2cell(tmp);
    tmp2(:,:,i) = cellfun(@double,tmp(2:end,:));
end

h = figure;bar(reshape(std(tmp2),[19,numel(method)]));
set(get(h,'Children'),'YScale','log')