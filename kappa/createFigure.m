% a = load('Image GdAx FSPGR 3D Navigator.mat');
% img = a.GdAx_FSPGR_3D_Navigator.Voxels(131:455,120:389,107);
% 
% GL      = [8 16 32];
% L       = [30000 20000 10000];
% glcm    = cell(3);
% imgs    = cell(3);
% 
% for i = 1:numel(GL)
%     for j = 1:numel(L)
%         [tmp imgs{i,j}] = graycomatrix(img,'Offset',[0 1; -1 1; -1 0; -1 -1],'NumLevels',GL(i),'graylimits',[0 L(j)],'symmetric',true);
%         glcm{i,j} = sum(tmp,3);
% %         feat(i,j) = GLCMFeatures(sum(glcm{i,j},3));
%         imwrite(uint8(round(imgs{i,j}*255/max(imgs{i,j}(:)))),sprintf('Image_GL%i_L%i.png',GL(i),L(j)));
%     end
% end

% 8 bits
L = linspace(10000,30000,100);
for j = 1:numel(L)
    [tmp] = graycomatrix(img,'Offset',[0 1; -1 1; -1 0; -1 -1],'NumLevels',8,'graylimits',[0 L(j)],'symmetric',true);
    glcm = sum(tmp,3);
    feat8(j) = GLCMFeatures(sum(glcm,3));
    invFeat8(j)=GLCMFeaturesInvariant(sum(glcm,3));
end
names = {'energy','entropy','homogeneity','contrast','autoCorrelation','informationMeasureOfCorrelation1'};
for i = 1:numel(names)
    A = [L' [feat8.(names{i})]'];
    B = [L' [invFeat8.(names{i})]'];
    csvwrite([names{i} '8bit.dat'],A)
    csvwrite([names{i} '8bitInv.dat'],B)
end

% 128 bit
for j = 1:numel(L)
    [tmp] = graycomatrix(img,'Offset',[0 1; -1 1; -1 0; -1 -1],'NumLevels',128,'graylimits',[0 L(j)],'symmetric',true);
    glcm = sum(tmp,3);
    invFeat128(j)=GLCMFeaturesInvariant(sum(glcm,3));
    feat128(j) = GLCMFeatures(sum(glcm,3));
end
for i = 1:numel(names)
    A = [L' [feat128.(names{i})]'];
    B = [L' [invFeat128.(names{i})]'];
    csvwrite([names{i} '128bit.dat'],A)
    csvwrite([names{i} '128bitInv.dat'],B)
end

% 10000
GL = 8:128;
for j = 1:numel(GL)
    [tmp] = graycomatrix(img,'Offset',[0 1; -1 1; -1 0; -1 -1],'NumLevels',GL(j),'graylimits',[0 10000],'symmetric',true);
    glcm = sum(tmp,3);
    feat10k(j) = GLCMFeatures(sum(glcm,3));
    invFeat10k(j)=GLCMFeaturesInvariant(sum(glcm,3));
end
for i = 1:numel(names)
    A = [GL' [feat10k.(names{i})]'];
    B = [GL' [invFeat10k.(names{i})]'];
    csvwrite([names{i} '10k.dat'],A)
    csvwrite([names{i} '10kInv.dat'],B)
end

% 3000
for j = 1:numel(GL)
    [tmp] = graycomatrix(img,'Offset',[0 1; -1 1; -1 0; -1 -1],'NumLevels',GL(j),'graylimits',[0 30000],'symmetric',true);
    glcm = sum(tmp,3);
    feat30k(j) = GLCMFeatures(sum(glcm,3));
    invFeat30k(j)=GLCMFeaturesInvariant(sum(glcm,3));
end
for i = 1:numel(names)
    A = [GL' [feat30k.(names{i})]'];
    B = [GL' [invFeat30k.(names{i})]'];
    csvwrite([names{i} '30k.dat'],A)
    csvwrite([names{i} '30kInv.dat'],B)
end



% f1 = figure(11);
% 
% for i = 1:9
%     imwrite(imgs)
%     subplot(3,3,i),imagesc(imgs{i})
%     colormap gray
% end

