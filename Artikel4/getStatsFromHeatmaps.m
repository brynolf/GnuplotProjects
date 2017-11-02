% orig = dlmread('res_orig_transposed.csv','\t');
% inv = dlmread('res_inv_transposed.csv','\t');

percent = 0.5:0.01:1;

for i = 1:numel(percent)
    origFrac(i) = sum(sum(orig>=percent(i)))./(16*16);
    invFrac(i) = sum(sum(inv>=percent(i)))/(16*16);
end

figure,stairs(origFrac,percent),hold on
stairs(invFrac,percent)

% origFrac = sum(sum(orig>percent))./(16*16);
% invFrac = sum(sum(inv>percent))/(16*16);

% sprintf('Orig: %3.3f, Inv: %3.3f,\r\n',origFrac,invFrac)