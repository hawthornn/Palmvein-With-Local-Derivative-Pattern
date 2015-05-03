clc;
clear;
close all;

load('featureA1.mat');
[row, col] = size(feature);
nPalm = 6;

for ii=1:row
    Histogram = [];
    for jj=1:col
        Histogram =[Histogram; sum(hist(feature{ii,jj},256),2)];
    end
    HistogramLDP(:,ii) = Histogram(:,:);
end

for ii=1:size(HistogramLDP,2)
    for jj=1:size(HistogramLDP,2)
        a(ii,jj) = Histogram_Intersection3(HistogramLDP(:,ii),HistogramLDP(:,jj));
    end
end

[value, index] = sort(a,2,'descend');


for kk = 1 : size(HistogramLDP,2)
    data(kk,1) = ceil(kk/nPalm);
end

jum = 0;
for ll =1:size(HistogramLDP,2)
   if(data(ll,1)==ceil(index(ll,2)/nPalm))
       jum = jum + 1;
   end
end
akurasi = (jum/size(HistogramLDP,2))*100;