% Connect to database
ResultconnStr = 'Data Source=m313835\PATRIK; Initial Catalog=textureValidation; User Id=Patrik; Password=Patrik';
handles.textureValidation = DatabaseHandler(ResultconnStr);
tableName = 'TextureResults';
colNames = handles.textureValidation.GetTableColsNames(tableName);



% Variables
variables = {'Contrast' ,'Correlation','Entropy','Homogeneity'};

param.GLCMResSettings = 2.^[3 4 5 6 7];
param.noiseSettings = [0 34 68];
param.xResSettings = [192 128 64];
param.yResSettings = [192 128 64];
param.windowMethods = {'Manual','AutoROI','AutoSlice'};
param.ADCMethods = {'linear[_]b0[-]1000','linear[_]b0[_]1000','linear[_]b200[_]1000','linear[_]b200[-]1000'};

% Define result matrices
result.(variables{1}) = zeros(numel(GLCMResSettings)*numel(xResSettings)*numel(yResSettings)*numel(noiseSettings)*numel(ADCMethods)...
    ,numel(windowMethods));
result.(variables{2}) = result.(variables{1});
result.(variables{3}) = result.(variables{1});
result.(variables{4}) = result.(variables{1});
row = 1;
col = 1;

for ADCMethod = param.ADCMethods
    for noise = param.noiseSettings
        for xRes = param.xResSettings
            for yRes = param.yResSettings
                for GLCMRes = param.GLCMResSettings
                    for  windowMethod = param.windowMethods
                   
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
                            xRes,yRes,GLCMRes,noise,ADCMethod{1},windowMethods{col});
                        
                        
                        tmp = handles.textureValidation.SqlQuery(query);
                        tmp = dataset2cell(tmp);
                        tmpData = median(cell2mat(tmp(2:end,:)));
                        
                        for i = 1:numel(tmpData)
                            result.(variables{i})(row,i) = tmpData(i);
                        end
                        
                        
                    end
                    row = row+1;
                end
            end
        end
    end
end

pars = fieldnames(param);
numCombs = 1;

for i = 1:numel(pars)
    numCombs = numCombs*numel(param.(pars{i}));
end

if numel(result.(variables{1})) ~= numCombs
    error('Size is not compatible with data!')
end
    

% Save structure to matlab file
save('windowMethodResults.mat','result')

% Save to text files for plotting with gnuplot
vars = fieldnames(result);
for i = 1:2:numel(vars)
    dlmwrite(fullfile('C:\Plots\TextureArticle\ScatterPlots',['windowMethods' vars{i} vars{i+1} '.csv']),[result.(vars{i}) result.(vars{i+1})])
end

