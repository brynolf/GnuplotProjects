function compileGLCMTextureFeatureData

% Find all files to be edited:
sourceFolder = 'C:\Mice Export\Mice Batch\20171019\#TexturePaper2Data';
targetFolder = '\\vll.se\users\NS\PABR03\Forskning\TextureArticle2\BrainData';
idx = numel(sourceFolder);

findPatients = dir(fullfile(sourceFolder,'*'));
patients = {findPatients(4:end).name};

% Create database
dbName = 'BrainRegions32GL.db';
conn = openDatabase(dbName);

% RegErrorFile
regErrorFile = 'badRegs2.txt';
fid = fopen(regErrorFile,'r');
tmp = textscan(fid,'%s','Delimiter','\n');
fclose(fid);
faultyRegs = tmp{1};

brainRegions = {'Cerebellum','FrontalCortex'};

% Loop over patients
for pat = 1:numel(patients)
    
    % Find all exams to be processed
    findExams = dir(fullfile(sourceFolder,patients{pat}));
    exams = {findExams(3:end).name};
    
    % Loop over exams
    for exam = 1:numel(exams)
        
        % Check if exam should be excluded due to faulty registration
        if ~max(strcmp(fullfile(sourceFolder,patients{pat},exams{exam}),faultyRegs))
            
            % Loop over brain regions
            for regs = 1:numel(brainRegions)
                
                findBRFiles = dir(fullfile(sourceFolder,patients{pat},exams{exam},sprintf('Image %s *.mat',brainRegions{regs})));
                brFiles = {findBRFiles(:).name};
                
                % Loop over all files
                for br = 1:numel(brFiles)
                    
                    % Find bitDepth
                    ind = regexp(brFiles{br},'\d');
                    bitDepth = str2double(brFiles{br}(ind(1):ind(end)));
                    
                    
                    % Check if data already in database
                    idx = fetch(conn,sprintf(['SELECT Idx from InvariantFeatures where PatientNumber = '...
                        '%d AND ExamNumber = %d AND BitDepth = %d AND BrainRegion like ''%s''' ],...
                        pat, exam, bitDepth, brainRegions{regs}));
                    
                    if isempty(idx)
                        % Read file
                        matContent = load(fullfile(sourceFolder,patients{pat},exams{exam},brFiles{br}));
                        fn = fieldnames(matContent);
                        GLCM = matContent.(fn{1}).Voxels;
                        
                        % Calc features
                        invariantData = GLCMFeaturesInvariant(GLCM);
                        originalData  = GLCMFeatures_fast(GLCM);
                        
                        % Insert into database
                        fn = fieldnames(invariantData);
                        inv = struct2cell(invariantData);
                        orig= struct2cell(originalData);
                        colNames        = [{'PatientNumber', 'ExamNumber', 'BitDepth', 'BrainRegion'},fn'];
                        colValsInv      = [{pat, exam, bitDepth, brainRegions{regs}} inv'];
                        colValsOrig     = [{pat, exam, bitDepth, brainRegions{regs}} orig'];
                        
                        insert(conn,'InvariantFeatures',colNames,colValsInv)
                        insert(conn,'OriginalFeatures',colNames,colValsOrig)
                    end
                end
            end
        end
    end
    fprintf('Patient %d\n',pat)
end