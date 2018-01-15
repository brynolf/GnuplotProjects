function conn = openDatabase(varargin)
dbName = varargin{1};
if exist(dbName,'file') == 2 && nargin == 1
    conn = sqlite(dbName,'connect');
    return
end

if nargin == 2 && exist(dbName,'file') == 2 && strcmpi(varargin{2},'create')
    delete(dbName)
end

% Create database file
conn = sqlite(dbName,'create');

% Create string
featNames = {'InvariantFeatures','OriginalFeatures'};
varNames = {'energy', 'contrast', 'correlation', 'sumOfSquaresVariance', ...
    'homogeneity', 'sumAverage', 'sumVariance', 'sumEntropy', ...
    'entropy', 'differenceVariance', 'differenceEntropy', ...
    'informationMeasureOfCorrelation1', 'informationMeasureOfCorrelation2', ...
    'maximalCorrelationCoefficient', 'autoCorrelation', 'dissimilarity',...
    'clusterShade', 'clusterProminence', 'maximumProbability', ...
    'inverseDifference', 'differenceAverage'};   

for fn = 1:numel(featNames)
    createStr{fn} = sprintf(['CREATE TABLE %s (Idx INTEGER PRIMARY KEY, ' ...
        'PatientNumber INTEGER, ExamNumber INTEGER, BitDepth INTEGER, BrainRegion TEXT'],featNames{fn});
    for vn = 1:numel(varNames)
        createStr{fn}  = [createStr{fn} ', ' varNames{vn} ' REAL'];
    end
    createStr{fn} = [createStr{fn} ')'];
    conn.exec(createStr{fn});
end
