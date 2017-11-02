% Connect to database
ResultconnStr = 'Data Source=m313835\PATRIK; Initial Catalog=textureValidation; User Id=Patrik; Password=Patrik';
handles.textureValidation = DatabaseHandler(ResultconnStr);
tableName = 'NormalizedTextureResults';

% Settings:
settings.noise = [0 34 68];
settings.voxelSize = [1.1979 1.7969 3.5937];
settings.WindowingMethod = {'AutoROI','AutoSlice' 'Manual'};
settings.ADCMethod = {'linear_b0_1000','linear_b0-1000','linear_b200_1000','linear_b200-1000'};
settings.GLCMSize = [128 64 32 16 8];
features = {'[autoCorrelation]', '[clusterProminence]','[clusterShade]', '[contrast]','[correlation]','[differenceEntropy]','[differenceVariance]','[dissimilarity]','[energy]'...
    ,'[entropy]','[homogeneity]','[infMeasCorr1]','[infMeasCorr2]','[inverseDifference]'...
    ,'[maxProbability]','[sumAverage]','[sumEntropy]','[sumOfSquares]','[sumVariance]'};
tmp2 = [];
j = 1;

parameters = fieldnames(settings);

for i = 1:numel(parameters)
    for j = 1:numel(GLCMSize)
        for k = 1:numel(features)
            for m = 1:numel(settings.(parameters{i}))
                
                query = generateSQLQuery(settings,features,currentParameter,m);
                
                tmp = handles.textureValidation.SqlQuery(query);
                tmp = dataset2cell(tmp);
                tmp2(:,j) = cell2mat(tmp(2:end,:));
            end
        end
        subplot(4,5,j)
        h2 = plot(tmp2','-o');
        title(features{k})
        xlabel('GLCM')
        h = get(h2(1),'parent');
        set(h,'XTick',1:numel(GLCMSize))
        set(h,'XTickLabel',GLCMSize)
    end
end
