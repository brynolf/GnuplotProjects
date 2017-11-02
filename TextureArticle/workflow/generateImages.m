dwi = Matrix4D.import('C:\Plots\TextureArticle\workflow\15');
ADC = Matrix4D.import('C:\Plots\TextureArticle\workflow\1');
resampledDWI = dwi.resample([64 64 19]);
for i = 1:6
    tmp = double(flipud(imrotate(dwi.matrix(35:end-34,20:end-19,7,i),90)));
    tmp2= double(flipud(imrotate(resampledDWI.matrix(12:end-11,7:end-6,7,i),90)));
    %Rescale image to 8 bits
    tmp = uint8(tmp./max(tmp(:))*256);
    tmp2 = uint8(tmp2./max(tmp2(:))*256);
    imwrite(tmp,sprintf('dwiImage%i.png',i))
    imwrite(tmp2,sprintf('dwiImageRes%i.png',i))
    
    noise = uint8((30*randn(size(tmp)))+128);
    noise(1,1:end) = 0;
    noise(end,1:end) = 0;
    noise(1:end,1) = 0;
    noise(1:end,end) = 0;
    imwrite(noise,sprintf('dwiNoise%i.png',i))
    
     
    
    
end

resampledADC = ADC.resample([64 64 19]);
tmp3 = double(flipud(imrotate(resampledADC.matrix(12:end-11,7:end-6,7),90)));
tmp3 = uint8(tmp3./max(tmp3(:))*256);
imwrite(tmp3,sprintf('ADCImage.png'))


for j = [8 16 32]
    clear a
    for i = 1:19
        a(:,:,i) = sum(graycomatrix(ADC.matrix(40:end-40,30:end-30,i),'GrayLimits',[],'numlevels',j,'offset',[0 1; -1 1; -1 0; -1 -1],'symmetric',true),3);
    end
    
    a = sum(a,3);
    b = a/max(a(:));
    b = log(b + min(b(b>0)));
    tmp = uint8((b-min(b(:)))./(max(b(:))-min(b(:)))*256);
%     figure, imshow(tmp,[])
    imwrite(tmp,sprintf('GLCM%i.png',j))
end