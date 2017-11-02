% Load data 
A = dlmread('C:\Plots\Artikel4\invDataCell.csv');
B = dlmread('C:\Plots\Artikel4\origDataCell.csv');

% 32 images are classified, calc probability of classification happening by
% chance, Bonferroni-corrected
% a = zeros(size(A));
% b = a;
nImages = 753;
% for i = 1:numel(A)
%     a(i) = sum(binopdf(A(i)*nImages:nImages,nImages,0.5));
%     b(i) = sum(binopdf(B(i)*nImages:nImages,nImages,0.5));
% end
% sig_inv = myBinomTest(A*32,32,0.5,'one')<0.05/(2*16*16);
% sig_orig = myBinomTest(B*32,32,0.5,'one')<0.05/(2*16*16);

% aa = binocdf(A*32,32,0.5,'upper');
% bb = binocdf(B*32,32,0.5,'upper');

sig_inv = binocdf(A*nImages-1,nImages,0.5,'upper')<0.0000001/(2*32*32);
sig_orig = binocdf(B*nImages-1,nImages,0.5,'upper')<0.0000001/(2*32*32);
0;

% Get coordniates of significance
[X_inv,Y_inv]=ind2sub([32, 32],find(fliplr(rot90(sig_inv',3))));
[X_orig,Y_orig]=ind2sub([32, 32],find(fliplr(rot90(sig_orig',3))));

% Export data 
dlmwrite('significaneCell_inv_transposed.dat',[Y_inv-1,X_inv-1],',');
dlmwrite('significaneCell_orig_transposed.dat',[Y_orig-1,X_orig-1],',');