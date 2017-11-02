% Connect to database
ResultconnStr = 'Data Source=m313835\PATRIK; Initial Catalog=textureValidation; User Id=Patrik; Password=Patrik';
handles.textureValidation = DatabaseHandler(ResultconnStr);
tableName = 'TextureResults';
colNames = handles.textureValidation.GetTableColsNames(tableName);

%% Anova on GLCMResolution
% query = ['select GLCMResolution, voxelSizeX, AddedNoiseStd,GLCMLimitsMethod, ADCMethod, [autoCorrelation] '...
%       ',[clusterProminence]'...
%       ',[clusterShade]'...
%       ',[contrast]'...
%       ',[correlation]'...
%       ',[differenceAverage]'...
%       ',[differenceEntropy]'...
%       ',[differenceVariance]'...
%       ',[dissimilarity]'...
%       ',[energy]'...
%       ',[entropy]'...
%       ',[homogeneity]'...
%       ',[infMeasCorr1]'...
%       ',[infMeasCorr2]'...
%       ',[inverseDifference]'...
%       ',[maxProbability]'...
%       ',[sumAverage]'...
%       ',[sumEntropy]'...
%       ',[sumOfSquares]'...
%       ',[sumVariance] from textureResults where voxelSizeX = voxelSizeY order by GLCMResolution, voxelSizeX, AddedNoiseStd,GLCMLimitsMethod, ADCMethod'];
% tmp = handles.textureValidation.SqlQuery(query);
% tmp = dataset2cell(tmp);

% % Load data
% load tmp
% % Create y variable
% y           = cell2mat(tmp(2:end,6)); % Autocorrelation
% GLCMRes     = cell2mat(tmp(2:end,1));
% Resolution  = cell2mat(tmp(2:end,2));
% Noise       = cell2mat(tmp(2:end,3));
% Limits      = tmp(2:end,4);
% ADC         = tmp(2:end,5);
% [p,table,stats,terms] = anovan(y,{GLCMRes,Resolution,Noise,Limits,ADC},'continuous',[1 2 3],'model','full');
% [p,table,stats,terms] = anovan(y,{GLCMRes,Resolution,Noise,Limits,ADC},'continuous',[1 2 3],'model',[eye(5);[ones(1,4); eye(4)]']);

%% Calculate sum of squares for the 5 groups
% Get values for the five factors

features = {'autoCorrelation'...
    'clusterProminence'...
    'clusterShade'...
    'contrast'...
    'correlation'...
    'differenceEntropy'...
    'differenceVariance'...
    'dissimilarity'...
    'energy'...
    'entropy'...
    'homogeneity'...
    'infMeasCorr1'...
    'infMeasCorr2'...
    'inverseDifference'...
    'maxProbability'...
    'sumAverage'...
    'sumEntropy'...
    'sumOfSquares'...
    'sumVariance'};
factors = {'ADCMethod','GLCMResolution','VoxelSizeX','GLCMLimitsMethod','AddedNoiseStd'};

% VoxelSize
tmp = handles.textureValidation.SqlQuery('select distinct voxelSizeX from textureResults order by voxelSizeX');
tmp = dataset2cell(tmp);
settings.VoxelSizeX = cell2mat(tmp(2:end));

% GLCMResolution
tmp = handles.textureValidation.SqlQuery('select distinct GLCMResolution from textureResults order by GLCMResolution');
tmp = dataset2cell(tmp);
settings.GLCMResolution = cell2mat(tmp(2:end));

% Noise
tmp = handles.textureValidation.SqlQuery('select distinct AddedNoiseStd from textureResults order by AddedNoiseStd');
tmp = dataset2cell(tmp);
settings.AddedNoiseStd = cell2mat(tmp(2:end));

% ADC
tmp = handles.textureValidation.SqlQuery('select distinct ADCMethod from textureResults order by ADCMethod');
tmp = dataset2cell(tmp);
settings.ADCMethod = tmp(2:end);

% WindowMethod
tmp = handles.textureValidation.SqlQuery('select distinct GLCMLimitsMethod from textureResults order by GLCMLimitsMethod');
tmp = dataset2cell(tmp);
settings.GLCMLimitsMethod = tmp(2:end);

%% Calc
% 1) Calculate SS and µ for each setting.
factors = fieldnames(settings);

% Loop over features
for feature = 1:numel(features)
    % Loop over factors
    for factor = 1:numel(factors)
        tmp2 = [];
        tmp4 = [];
        % Loop over levels
        for level = 1:numel(settings.(factors{factor}))
                       
            levels = getMidLevels(factors,settings);
            levels(factor) = level;
            
            % Query database for specific levels
            query  = sprintf(['select avg(%s) as Mean, var(%s) as Variance ,count(%s) as N from textureResults where'],features{feature},features{feature},features{feature});
            query2 = sprintf(['select %s as N from textureResults where'],features{feature});
            
            for i = 1:numel(factors)
                if i > 1
                    query  = [query ' and '];
                    query2 = [query2 ' and '];
                end
                query = sprintf([query ' %s '],factors{i});
                query2 = sprintf([query2 ' %s '],factors{i});
                if isa(settings.(factors{i})(levels(i)),'cell')
                    query = sprintf([query 'like ''%s''' ],settings.(factors{i}){levels(i)});
                    query2 = sprintf([query2 'like ''%s''' ],settings.(factors{i}){levels(i)});
                elseif isa(settings.(factors{i}),'float')
                    query = sprintf([query '= %2.4f' ],settings.(factors{i})(levels(i)));
                    query2 = sprintf([query2 '= %2.4f' ],settings.(factors{i})(levels(i)));
                    if strcmp(factors{i},'VoxelSizeX')
                        query = sprintf([query ' and VoxelSizeY = %2.4f'],settings.(factors{i})(levels(i)));
                        query2 = sprintf([query2 ' and VoxelSizeY = %2.4f'],settings.(factors{i})(levels(i)));
                    end
                else
                    query = sprintf([query '= %i' ],settings.(factors{i})(levels(i)));
                    query2 = sprintf([query2 '= %i' ],settings.(factors{i})(levels(i)));
                end
            end
            
            % We need to escape underscore character, it is a wildcard in SQL
            query = regexprep(query,'_','[_]');
            query2 = regexprep(query2,'_','[_]');
            
            tmp = handles.textureValidation.SqlQuery(query);
            tmp = dataset2cell(tmp);
            tmp2(level,:) = cellfun(@double,tmp(2:end,:));
            
            tmp3 = handles.textureValidation.SqlQuery(query2);
            tmp3 = dataset2cell(tmp3);
            tmp4(:,level) = cellfun(@double,tmp3(2:end,:));
            
            0;
            
            if level > 1
                
            end
            
            
        end
        
        
        
        % Loop over all levels
        
        h = figure(factor);
        set(h,'name',factors{factor})
        set(h,'NumberTitle','off');
        h_1 = subplot(4,5,feature);
        errorbar(1:numel(settings.(factors{factor})),tmp2(:,1)',sqrt(tmp2(:,2)'));
        h3_1 = figure(100+factor);
        set(h3_1,'name',factors{factor})
        set(h3_1,'NumberTitle','off');
        h3 = subplot(4,5,feature);
        qqplot(tmp4);
        
        set(get(h,'children'),'XTick',1:numel(settings.(factors{factor})))
        try
            set(get(h,'children'),'XTickLabel',num2str(settings.(factors{factor})))
        catch
            set(get(h,'children'),'XTickLabel',(settings.(factors{factor})))
        end
        title(h_1,features{feature})
        title(h3,features{feature})
        xlabel(h3,'');ylabel(h3,'');
        
        % Sum of squares within groups
        SSW = sum(tmp2(:,2).*(tmp2(:,3)-1));
        NW = sum(tmp2(:,3))-numel(tmp2(:,3));
        meanSquareW = SSW/NW;
        
        % Sum of squares between groups
        muTot = sum(tmp2(:,1).*tmp2(:,3))./(sum(tmp2(:,3)));
        SSB = sum(tmp2(:,3).*(tmp2(:,1)-muTot).^2);
        NB  = numel(tmp2(:,3))-1;
        meanSquareB = SSB/NB;
        
        % Total sum of squares
        SST = SSW + SSB;
        NT = NB + NW;
        
        F = meanSquareB/meanSquareW;
        p(factor,feature) = (1-fcdf(F,NB,NW))*100;
        0;
    end
end
h2 = figure;
imagesc(p,[0 0.05]);
set(get(h2,'children'),'XTick',1:numel(features))
set(get(h2,'children'),'YTick',1:numel(factors))
set(get(h2,'children'),'YTickLabel',factors)
set(get(h2,'children'),'XTickLabel',features)
set(get(h2,'children'),'XTickLabelRotation',60)