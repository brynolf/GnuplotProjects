% Load data 
A = dlmread('C:\Plots\Artikel4\res2_inv_transposed.csv');
B = dlmread('C:\Plots\Artikel4\res2_orig2_transposed.csv');

% 32 images are classified, calc probability of classification happening by
% chance, Bonferroni-corrected
a = zeros(size(A));
b = a;
nImages = 32;
for i = 1:numel(A)
    a(i) = sum(binopdf(A(i)*nImages:nImages,nImages,0.5));
    b(i) = sum(binopdf(B(i)*nImages:nImages,nImages,0.5));
end
% sig_inv = myBinomTest(A*32,32,0.5,'one')<0.05/(2*16*16);
% sig_orig = myBinomTest(B*32,32,0.5,'one')<0.05/(2*16*16);

% aa = binocdf(A*32,32,0.5,'upper');
% bb = binocdf(B*32,32,0.5,'upper');

sig_inv = binocdf(A*nImages-1,nImages,0.5,'upper')<0.05/(2*16*16);
sig_orig = binocdf(B*nImages-1,nImages,0.5,'upper')<0.05/(2*16*16);
0;

% Get coordniates of significance
[X_inv,Y_inv]=ind2sub([16, 16],find(sig_inv'));
[X_orig,Y_orig]=ind2sub([16, 16],find(sig_orig'));

% Export data 
dlmwrite('significane2_inv_transposed.dat',[X_inv-1,Y_inv-1],' ');
dlmwrite('significane2_orig_transposed.dat',[X_orig-1,Y_orig-1],' ');