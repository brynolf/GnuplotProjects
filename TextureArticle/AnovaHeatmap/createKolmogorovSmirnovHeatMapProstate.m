% Connect to database
ResultconnStr = 'Data Source=m313835\PATRIK; Initial Catalog=textureValidation; User Id=Patrik; Password=Patrik';
handles.textureValidation = DatabaseHandler(ResultconnStr);
tableNames = {'textureResultsProstate','normalizedTextureResultsProstate'};
% colNames = handles.textureValidation.GetTableColsNames(tableName{1});

visualize = false;
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
factors = {'GLCMResolution','VoxelSizeX','GLCMLimitsMethod','AddedNoiseStd'};

for tableName = tableNames
    settings = [];
    % levels
    % VoxelSize
    tmp = handles.textureValidation.SqlQuery(sprintf('select distinct voxelSizeX from %s order by voxelSizeX',tableName{1}));
    tmp = dataset2cell(tmp);
    settings.VoxelSizeX = cell2mat(tmp(2:end));
    
    % VoxelSize
    tmp = handles.textureValidation.SqlQuery(sprintf('select distinct voxelSizeY from %s order by voxelSizeY',tableName{1}));
    tmp = dataset2cell(tmp);
    settings.VoxelSizeY = cell2mat(tmp(2:end));
    
    % GLCMResolution
    tmp = handles.textureValidation.SqlQuery(sprintf('select distinct GLCMResolution from %s order by GLCMResolution',tableName{1}));
    tmp = dataset2cell(tmp);
    settings.GLCMResolution = cell2mat(tmp(2:end));
    
    % Noise
    tmp = handles.textureValidation.SqlQuery(sprintf('select distinct AddedNoiseStd from %s order by AddedNoiseStd',tableName{1}));
    tmp = dataset2cell(tmp);
    settings.AddedNoiseStd = cell2mat(tmp(2:end));
    
    % WindowMethod
    tmp = handles.textureValidation.SqlQuery(sprintf('select distinct GLCMLimitsMethod from %s order by GLCMLimitsMethod',tableName{1}));
    tmp = dataset2cell(tmp);
    settings.GLCMLimitsMethod = tmp(2:end);
    
    %% Calc
    % factors = fieldnames(settings);
    testCntr = 0;
    
    % Alpha value, for significance, e.g. 0.05
    alpha = 0.01;
    
    [levels,totLevels] = getMidLevels(factors,settings);
    nTests = sum(19*totLevels.*(totLevels-1)/2);
    nTests = 836;
    p = [];p2 = []; H = [];
    % Loop over factors
    for factor = 1:numel(factors)
        
        % Loop over features
        for feature = 1:numel(features)
            
            tmp2 = [];
            tmp4 = [];
            % Loop over levels
            for level = 1:numel(settings.(factors{factor}))
                
                [levels,totLevels] = getMidLevels(factors,settings);
                levels(factor) = level;
                
                % Query database for specific levels
                query = sprintf(['select %s as N from %s where'],features{feature},tableName{1});
                
                for i = 1:numel(factors)
                    if i > 1
                        query = [query ' and '];
                    end
                    query = sprintf([query ' %s '],factors{i});
                    if isa(settings.(factors{i})(levels(i)),'cell')
                        query = sprintf([query 'like ''%s''' ],settings.(factors{i}){levels(i)});
                    elseif isa(settings.(factors{i}),'float')
                        query = sprintf([query '= %2.4f' ],settings.(factors{i})(levels(i)));
                        if strcmp(factors{i},'VoxelSizeX')
                            query = sprintf([query ' and VoxelSizeY = %2.4f'],settings.VoxelSizeY(levels(i)));
                        end
                    else
                        query = sprintf([query '= %i' ],settings.(factors{i})(levels(i)));
                    end
                end
                
                % We need to escape underscore character, it is a wildcard in SQL
                query = regexprep(query,'_','[_]');
                
                tmp = handles.textureValidation.SqlQuery(query);
                tmp = dataset2cell(tmp);
                tmp2(:,level) = cellfun(@double,tmp(2:end,:));
                0;
            end
            
            0;
            % Perform Kolmogorov-Smirnov test
            p0 = [];
            h0 = [];
            for i = 1:min(size(tmp2))-1
                for j = (i+1):min(size(tmp2))
                    [h0(end+1),p0(end+1)] = kstest2(tmp2(:,i),tmp2(:,j),'alpha',alpha/nTests);
                    testCntr = testCntr + 1;
                end
            end
            
            % Loop over all levels
            if visualize
                h = figure(factor);
                set(h,'name',factors{factor})
                set(h,'NumberTitle','off');
                h_1 = subplot(4,5,feature);
                errorbar(1:numel(settings.(factors{factor})),mean(tmp2)',std(tmp2)');
                %         h3_1 = figure(100+factor);
                %         set(h3_1,'name',factors{factor})
                %         set(h3_1,'NumberTitle','off');
                %         h3 = subplot(4,5,feature);
                %         qqplot(tmp2);
                
                set(get(h,'children'),'XTick',1:numel(settings.(factors{factor})))
                try
                    set(get(h,'children'),'XTickLabel',num2str(settings.(factors{factor})))
                catch
                    set(get(h,'children'),'XTickLabel',(settings.(factors{factor})))
                end
                title(h_1,features{feature})
            end
            %         title(h3,features{feature})
            %         xlabel(h3,'');ylabel(h3,'');
            
            % Sum of squares within groups
            SSW = sum(var(tmp2).*(length(tmp2)-1));
            NW = numel(tmp2)-min(size(tmp2));
            meanSquareW = SSW/NW;
            
            % Sum of squares between groups
            muTot = mean(tmp2(:));
            SSB = sum(length(tmp2).*(mean(tmp2)-muTot).^2);
            NB  = min(size(tmp2))-1;
            meanSquareB = SSB/NB;
            
            % Total sum of squares
            SST = SSW + SSB;
            NT = NB + NW;
            
            F = meanSquareB/meanSquareW;
            p(feature,factor) = (1-fcdf(F,NB,NW));
            H(feature,factor) = p(feature,factor) < alpha/(numel(features)*numel(factors));
            p2(feature,factor) = min(p0);
            H2(feature,factor) = max(h0);
            
            
            
        end
    end
    
    % Change order of presentation heatmap
%     p22 = p2(:,[2 4 1 3]);
%     H22 = H2(:,[2 4 1 3]);
    p22 = p2(:,[1 3 2 4]);
    H22 = H2(:,[1 3 2 4]);
    % h2 = figure;
    % imagesc(p,[0 0.05]/(numel(factors)*numel(features)));
    % title('Anova p-values')
    % set(get(h2,'children'),'YTick',1:numel(features))
    % set(get(h2,'children'),'XTick',1:numel(factors))
    % set(get(h2,'children'),'XTickLabel',factors)
    % set(get(h2,'children'),'YTickLabel',features)
    % set(get(h2,'children'),'XTickLabelRotation',60)
    %
    % h3 = figure;
    % imagesc(p2,[0 0.05]/nTests);
    % title('KS p-values')
    % set(get(h3,'children'),'YTick',1:numel(features))
    % set(get(h3,'children'),'XTick',1:numel(factors))
    % set(get(h3,'children'),'XTickLabel',factors)
    % set(get(h3,'children'),'YTickLabel',features)
    % set(get(h3,'children'),'XTickLabelRotation',60)
    %
    % h4 = figure;
    % imagesc(H,[0 0.05]/nTests);
    % title('KS hypothesis rejection')
    % set(get(h4,'children'),'YTick',1:numel(features))
    % set(get(h4,'children'),'XTick',1:numel(factors))
    % set(get(h4,'children'),'XTickLabel',factors)
    % set(get(h4,'children'),'YTickLabel',features)
    % set(get(h4,'children'),'XTickLabelRotation',60)
    
    % Save data
    fid = fopen(sprintf('C:\\Plots\\TextureArticle\\AnovaHeatmap\\heatmapAnova_%s.bin',tableName{1}),'w');
    fwrite(fid,p,'double');
    fclose(fid);
    
    [I,J] = ind2sub(size(H),find(H));
    dlmwrite(sprintf('C:\\Plots\\TextureArticle\\AnovaHeatmap\\significantAnova_%s.dat',tableName{1}),[J-1 I-1]);
    
    fid = fopen(sprintf('C:\\Plots\\TextureArticle\\AnovaHeatmap\\heatmapKS_%s.bin',tableName{1}),'w');
    fwrite(fid,p2,'double');
    fclose(fid);
    
    [I,J] = ind2sub(size(H2),find(H2));
    dlmwrite(sprintf('C:\\Plots\\TextureArticle\\AnovaHeatmap\\significantKS_%s.dat',tableName{1}),[J-1 I-1]);
    
    fid = fopen(sprintf('C:\\Plots\\TextureArticle\\AnovaHeatmap\\heatmapKSPresentation_%s.bin',tableName{1}),'w');
    fwrite(fid,p22,'double');
    fclose(fid);
    
    [I,J] = ind2sub(size(H22),find(H22));
    dlmwrite(sprintf('C:\\Plots\\TextureArticle\\AnovaHeatmap\\significantKSPresentation_%s.dat',tableName{1}),[J-1 I-1]);
end