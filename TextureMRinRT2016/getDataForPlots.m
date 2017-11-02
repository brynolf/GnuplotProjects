function query = getDataForPlots(variables)
% Create query, get the standard deviation of every texture feature

query = sprintf('select %s as %s ',variables{1},variables{1});

for variable = variables(2:end)
    query = sprintf([query ', %s AS %s'],variable{1},variable{1});
end

query = sprintf([query ' from ' tableName ' where '...
    'SeriesDescription like ''ep2d%%'' '...
    'and ImageXSize = %i '...
    'and ImageYSize = %i '...
    'and GLCMResolution = %i '...
    'and AddedNoiseStd = %i '...
    'and ADCMethod like ''%s'' '...
    'and GLCMLimitsMethod like ''%s'''],...
    xRes,yRes,GLCMRes,noise,ADCMethod{1},windowMethods{windowMethod});
