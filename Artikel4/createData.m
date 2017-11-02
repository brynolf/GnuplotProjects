image = randi(100,256, 256);
nGL = 8;
dX = 1/nGL;
GLCM8 = sum(graycomatrix(paint,'GrayLimits', [13 218],'NumLevels',nGL,'Offset',[0 1;1 1;1 0;-1 1],'Symmetric',true),3);
nGLCM8 = GLCM8./(sum(GLCM8(:)));
C1 = sum(sum(GLCM8*dX.^2));
NGLCM8 = GLCM8*C1;

nGL = 32;
dX = 1/nGL;
GLCM32 = sum(graycomatrix(paint,'GrayLimits', [13 218],'NumLevels',nGL,'Offset',[0 1;1 1;1 0;-1 1],'Symmetric',true),3);
nGLCM32 = GLCM32./(sum(GLCM32(:)));
C2 = sum(sum(GLCM32*dX.^2));
NGLCM32 = GLCM32*C2;
figure,
subplot(2,2,1), h1 = bar3(nGLCM8);
zlim([0 max(max(nGLCM8(:)),max(nGLCM32(:)))])
subplot(2,2,2), h2 = bar3(nGLCM32);
zlim([0 max(max(nGLCM8(:)),max(nGLCM32(:)))])
subplot(2,2,3), h1 = bar3(NGLCM8);
% zlim([0 max(max(nGLCM8(:)),max(nGLCM32(:)))])
subplot(2,2,4), h2 = bar3(NGLCM32);
% zlim([0 max(max(nGLCM8(:)),max(nGLCM32(:)))])

for k = 1:length(h1)
    zdata = h1(k).ZData;
    h1(k).CData = zdata;
    h1(k).FaceColor = 'interp';
end

for k = 1:length(h2)
    zdata = h2(k).ZData;
    h2(k).CData = zdata;
    h2(k).FaceColor = 'interp';
end
