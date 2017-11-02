function [midLevels, totLevels] = getMidLevels(variables, settings)
midLevels = zeros(1,numel(variables));
totLevels = midLevels;
for i = 1:numel(variables)
    if strcmp(variables{i},'AddedNoiseStd')
        midLevels(i) = 1;
        totLevels(i) = numel(settings.(variables{i}));
    elseif strcmp(variables{i},'VoxelSizeX')
        midLevels(i) = 1;
        totLevels(i) = numel(settings.(variables{i}));
    elseif strcmp(variables{i},'GLCMLimitsMethod')
        midLevels(i) = 1;
        totLevels(i) = numel(settings.(variables{i}));
    elseif strcmp(variables{i},'ADCMethod')
        midLevels(i) = 4;
        totLevels(i) = numel(settings.(variables{i}));
    elseif strcmp(variables{i},'GLCMResolution')
        totLevels(i) = 3;
        midLevels(i) = round(totLevels(i)/2);
    end
end
