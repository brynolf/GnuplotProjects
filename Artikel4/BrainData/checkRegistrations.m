function checkRegistrations

% Find all resultImages
resultImages = recursiveFindFiles('C:\Mice Export\Mice Batch\20171019\#TexturePaper2Data','*.jpg');
currentFolder = [];
nextFolder = [];
resultFileFID = fopen('badRegs2.txt','a');

% Loop over all resultImages, display them and
for i = 1:numel(resultImages)
    currentFolder = fileparts(resultImages{i});
    try
        nextFolder = fileparts(resultImages{i+1});
    catch
        nextFolder = 'No more folders';
    end
    img = imread(resultImages{i});
    figure(1)
    imshow(img,[])
    pause
    
    % If we finnished reviewing one exam
    if ~strcmp(currentFolder,nextFolder)
        rating = input('Good? ', 's');
        if strcmp(rating,'n')
            fprintf(resultFileFID,'%s\r\n',currentFolder);
        end
    end
        
end
fclose(resultFileFID);