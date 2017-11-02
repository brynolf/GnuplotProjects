function data = getDataForCloudPlot(settings,feature,currentParameter,handles,tableName)

switch currentParameter
    case 'noise'
        data = zeros(72,numel(settings.(currentParameter)));
        for i = 1:numel(settings.(currentParameter))
            query = generateSQLQuery(feature, settings.voxelSize(1),settings.GLCMSize(3),settings.noise(i),settings.WindowingMethod{1},settings.ADCMethod{1},tableName);
            tmp = handles.textureValidation.SqlQuery(query);
            tmp = dataset2cell(tmp);
            data(:,i) = cell2mat(tmp(2:end,:));
            
        end

    case 'voxelSize'
        data = zeros(72,numel(settings.(currentParameter)));
        for i = 1:numel(settings.(currentParameter))
            query = generateSQLQuery(feature, settings.voxelSize(i),settings.GLCMSize(3),settings.noise(1),settings.WindowingMethod{1},settings.ADCMethod{1},tableName);
            tmp = handles.textureValidation.SqlQuery(query);
            tmp = dataset2cell(tmp);
            data(:,i) = cell2mat(tmp(2:end,:));
        end
    case 'GLCMSize'
        data = zeros(72,numel(settings.(currentParameter)));
        for i = 1:numel(settings.(currentParameter))
            query = generateSQLQuery(feature, settings.voxelSize(1),settings.GLCMSize(i),settings.noise(1),settings.WindowingMethod{1},settings.ADCMethod{1},tableName);
            tmp = handles.textureValidation.SqlQuery(query);
            tmp = dataset2cell(tmp);
            data(:,i) = cell2mat(tmp(2:end,:));
        end
    case 'ADCMethod'
        data = zeros(72,numel(settings.(currentParameter)));
        for i = 1:numel(settings.(currentParameter))
            query = generateSQLQuery(feature, settings.voxelSize(1),settings.GLCMSize(3),settings.noise(1),settings.WindowingMethod{1},settings.ADCMethod{i},tableName);
            tmp = handles.textureValidation.SqlQuery(query);
            tmp = dataset2cell(tmp);
            data(:,i) = cell2mat(tmp(2:end,:));
        end
    case 'WindowingMethod'
        data = zeros(72,numel(settings.(currentParameter)));
        for i = 1:numel(settings.(currentParameter))
            query = generateSQLQuery(feature, settings.voxelSize(1),settings.GLCMSize(3),settings.noise(1),settings.WindowingMethod{i},settings.ADCMethod{1},tableName);
            tmp = handles.textureValidation.SqlQuery(query);
            tmp = dataset2cell(tmp);
            data(:,i) = cell2mat(tmp(2:end,:));
        end
end
