% Connect to database
ResultconnStr = 'Data Source=m313835\PATRIK; Initial Catalog=textureValidation; User Id=Patrik; Password=Patrik';
handles.textureValidation = DatabaseHandler(ResultconnStr);
% tableNames = {'TextureResults','normalizedTextureResults'};
tableNames = {'TextureResults'};

% Get GLCM Size plots
features    = {'autoCorrelation' ,'clusterProminence','clusterShade','contrast','correlation',...
      'differenceEntropy','differenceVariance','dissimilarity','energy','entropy','homogeneity',...
      'infMeasCorr1','infMeasCorr2','inverseDifference','maxProbability','sumAverage','sumEntropy','sumOfSquares','sumVariance'};
table       = 'textureResults';

for feature = features
    
    ADC         = 'linear_b200-1000';
    quantMethod = 'AutoROI';
    res         = 1.1979;
    noise       = 0;
    GLCM        = 32;
    
    GLCM        = 2.^[3 4 5 6 7];
    for GLCMi = 1:numel(GLCM)
        query = sprintf('select %s from %s where %s like ''%s'' and %s like ''%s'' and %s = %f and %s = %f and %s = %f and %s = %f order by UID',...
            feature{1},table,'ADCMethod',ADC,'GLCMLimitsMethod',quantMethod,'VoxelSizeX',res,'VoxelSizeY',res,'AddedNoiseStd',noise,'GLCMResolution',GLCM(GLCMi));
        
        query = regexprep(query,'_','[_]');
        tmp = handles.textureValidation.SqlQuery(query);
        tmp = dataset2cell(tmp);
        tmp2(:,GLCMi) = cellfun(@double,tmp(2:end,:));
        dlmwrite([feature{1} 'GLCMs.dat'],tmp2);
    end
    
    GLCM        = 32;
    noise       = [0 29.4449 65.8407];
%     noise       = [0 34 68];
    tmp2 = [];
    for noisei = 1:numel(noise)
        query = sprintf('select %s from %s where %s like ''%s'' and %s like ''%s'' and %s = %f and %s = %f and %s = %f and %s = %f order by UID',...
            feature{1},table,'ADCMethod',ADC,'GLCMLimitsMethod',quantMethod,'VoxelSizeX',res,'VoxelSizeY',res,'AddedNoiseStd',noise(noisei),'GLCMResolution',GLCM);
        
        query = regexprep(query,'_','[_]');
        tmp = handles.textureValidation.SqlQuery(query);
        tmp = dataset2cell(tmp);
        tmp2(:,noisei) = cellfun(@double,tmp(2:end,:));
        dlmwrite([feature{1} 'Noise.dat'],tmp2);
    end
    
    
    noise= 0;
    res  = [1.1979 1.7969 3.5937];
    tmp2 = [];
    for resi = 1:numel(res)
        query = sprintf('select %s from %s where %s like ''%s'' and %s like ''%s'' and %s = %f and %s = %f and %s = %f and %s = %f order by UID',...
            feature{1},table,'ADCMethod',ADC,'GLCMLimitsMethod',quantMethod,'VoxelSizeX',res(resi),'VoxelSizeY',res(resi),'AddedNoiseStd',noise,'GLCMResolution',GLCM);
        
        query = regexprep(query,'_','[_]');
        tmp = handles.textureValidation.SqlQuery(query);
        tmp = dataset2cell(tmp);
        tmp2(:,resi) = cellfun(@double,tmp(2:end,:));
        dlmwrite([feature{1} 'Resolution.dat'],tmp2);
    end
    
    res  = 1.1979;
    quantMethods = {'AutoROI','Manual','AutoSlice'};
    tmp2 = [];
    for quantMethodi = 1:numel(quantMethods)
        query = sprintf('select %s from %s where %s like ''%s'' and %s like ''%s'' and %s = %f and %s = %f and %s = %f and %s = %f order by UID',...
            feature{1},table,'ADCMethod',ADC,'GLCMLimitsMethod',quantMethods{quantMethodi},'VoxelSizeX',res,'VoxelSizeY',res,'AddedNoiseStd',noise,'GLCMResolution',GLCM);
        
        query = regexprep(query,'_','[_]');
        tmp = handles.textureValidation.SqlQuery(query);
        tmp = dataset2cell(tmp);
        tmp2(:,quantMethodi) = cellfun(@double,tmp(2:end,:));
        dlmwrite([feature{1} 'QuantMethod.dat'],tmp2);
    end
    
    quantMethods = 'AutoROI';
    ADC = {'linear_b200-1000','linear_b200_1000','linear_b0_1000','linear_b0-1000'};
    tmp2 = [];
    for ADCi = 1:numel(ADC)
        query = sprintf('select %s from %s where %s like ''%s'' and %s like ''%s'' and %s = %f and %s = %f and %s = %f and %s = %f order by UID',...
            feature{1},table,'ADCMethod',ADC{ADCi},'GLCMLimitsMethod',quantMethods,'VoxelSizeX',res,'VoxelSizeY',res,'AddedNoiseStd',noise,'GLCMResolution',GLCM);
        
        query = regexprep(query,'_','[_]');
        tmp = handles.textureValidation.SqlQuery(query);
        tmp = dataset2cell(tmp);
        tmp2(:,ADCi) = cellfun(@double,tmp(2:end,:));
        dlmwrite([feature{1} 'ADC.dat'],tmp2);
    end
end