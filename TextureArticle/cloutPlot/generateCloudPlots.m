% Connect to database
ResultconnStr = 'Data Source=m313835\PATRIK; Initial Catalog=textureValidation; User Id=Patrik; Password=Patrik';
handles.textureValidation = DatabaseHandler(ResultconnStr);
tableName = 'TextureResultsFinal';

% Settings:
settings.noise = [0 29.4449 65.8407];
settings.voxelSize = [1.1979 1.7969 3.5937];
settings.WindowingMethod = {'AutoROI','AutoSlice' 'Manual'};
settings.ADCMethod = {'linear_b0_1000','linear_b0-1000','linear_b200_1000','linear_b200-1000'};
settings.GLCMSize = [8 16 32 64 128];
features = {'[autoCorrelation]', '[clusterProminence]','[clusterShade]', '[contrast]','[correlation]','[differenceEntropy]','[differenceVariance]','[dissimilarity]','[energy]'...
    ,'[entropy]','[homogeneity]','[infMeasCorr1]','[infMeasCorr2]','[inverseDifference]'...
    ,'[maxProbability]','[sumAverage]','[sumEntropy]','[sumOfSquares]','[sumVariance]'};

parameters = fieldnames(settings);
j = 1;

for i = 1:numel(parameters)
    figure
    for j = 1:numel(settings.(parameters{i}))
        for k = 1:numel(features)
            data = getDataForCloudPlot(settings,features{k},parameters{i},handles,tableName);
            
            subplot(4,5,k)
            h2 = plot(data','-o');
            title(features{k})
            xlabel(parameters{i})
            h = get(h2(1),'parent');
            set(h,'XTick',1:numel(settings.(parameters{i})))
            set(h,'XTickLabel',settings.(parameters{i}))
            
        end
        
    end
    0;
end
