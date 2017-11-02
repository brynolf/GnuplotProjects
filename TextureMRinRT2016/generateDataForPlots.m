% Connect to database
ResultconnStr = 'Data Source=m313835\PATRIK; Initial Catalog=textureValidation; User Id=Patrik; Password=Patrik';
handles.textureValidation = DatabaseHandler(ResultconnStr);
tableName = 'TextureResults';
colNames = handles.textureValidation.GetTableColsNames(tableName);



% Variables
variables = {'Contrast','Correlation','Entropy','Homogeneity'};

GLCMResSettings = 2.^[3 4 5 6 7];
noiseSettings = [0 34 68];
xResSettings = [192 128 64];
yResSettings = [192 128 64];
windowMethods = {'Manual','AutoROI','AutoSlice'};
ADCMethods = {'linear[_]b0[-]1000','linear[_]b0[_]1000','linear[_]b200[_]1000','linear[_]b200[-]1000'};

% Define result matrices
result =[];
result.(variables{1}) = zeros(numel(windowMethods)*numel(GLCMResSettings)*numel(yResSettings)*numel(ADCMethods),...
        numel(xResSettings)*numel(noiseSettings));
for i = 1:numel(variables)
    result.(variables{i}) = result.(variables{1});
end
row = 1;

for ADCMethod = ADCMethods
    for yRes = yResSettings
        for windowMethod = windowMethods
            for GLCMRes = GLCMResSettings
                col = 1;
                for xRes = xResSettings
                    for noise = noiseSettings
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
                            xRes,yRes,GLCMRes,noise,ADCMethod{1},windowMethod{1});
                        
                        
                        tmp = handles.textureValidation.SqlQuery(query);
                        tmp = dataset2cell(tmp);
                        tmpData = nanmedian(cell2mat(tmp(2:end,:)));
                        
                        for i = 1:numel(tmpData)
                            result.(variables{i})(row,col) = tmpData(i);
                        end
                        
                        col = col+1;
                    end
                end
                row = row+1;
            end
        end
    end
end

% Check number of elements in final matrix
if numel(result.Contrast) ~= 1620
    error('Wrong size of final results!')
end

% Save structure to matlab file
% save('GLCMResResults.mat','result')

% Save to text files for plotting with gnuplot
vars = fieldnames(result);
for i = 1:numel(vars)
    dlmwrite(['FreqResNoise' vars{i} '.csv'],result.(vars{i}))
end

