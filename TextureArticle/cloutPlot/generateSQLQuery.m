function query = generateSQLQuery(feature, voxelSize,GLCMSize,noise,WindowingMethod,ADCMethod,tableName)
query = sprintf(['SELECT %s from %s where '...
    'abs(VoxelSizeX-%i) < 0.1 '...
    'and abs(VoxelSizeY-%i) < 0.1 '...
    'and GLCMResolution = %i '...
    'and AddedNoiseStd = %i '...
    'and GLCMLimitsMethod like ''%s'''...
    'and ADCMethod like ''%s'''],...
    feature,...
    tableName,...
    voxelSize,...
    voxelSize,...
    GLCMSize,...
    noise,...
    WindowingMethod,...
    ADCMethod); %#ok<*FNDSB>

query = [query ' order by UID'];
% We need to escape underscore character, it is a wildcard in SQL
query = regexprep(query,'_','[_]');