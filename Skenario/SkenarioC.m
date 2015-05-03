%% Source Code Tugas Akhir Skenario C (Akhmad Faizal Akbar 1103110183)
% Dataset CASIA Menggunakan 850nm tangan kiri

%% Deskripsi Skenario C
% Order = 3 dan Scale = 1 sampai 6
% Plam(Telapak Tangan)
% Perblock(16 block)
%% Inisialisasi
clc;
clear all;
close all;

nData = 100; % jumlah data orang
nPalm = 6;   % jumlah telapaktangan
c = 1;
r = 1;
resize = [236 236]; % ukuran resize

%% Program Utama
for i=1:nData
    if i<10
        id = ['00', num2str(i)];
    elseif i<nData
        id = ['0', num2str(i)];
    else
        id = num2str(i);
    end
    for j=1:nPalm
        I = imread(['ROI_segmentasi/',id,'_l_850_0',num2str(j),'.jpg']);
        vein = adapthisteq(uint8(I)); % menggunakan adaptif histogram equalisasi untuk proses filter 
        vein = imresize(vein, [resize(1,1) resize(1,2)], 'bicubic'); %resize sesuai dengan paper
        disp([id, '_l_850_0',num2str(j), '.jpg']);
        
        vein = double(vein);
        crange = resize(1,2)/4;
        rrange = resize(1,1)/4;
        for ii=1:rrange:resize(1,2)
            for jj=1:crange:resize(1,1)
                feature{r,c} = LDPsc(LDPsc(vein(ii:rrange+ii-1,jj:crange+jj-1),0,1),0,1);
                feature{r,c+1} = LDPsc(LDPsc(vein(ii:rrange+ii-1,jj:crange+jj-1),45,1),45,1);
                feature{r,c+2} = LDPsc(LDPsc(vein(ii:rrange+ii-1,jj:crange+jj-1),90,1),90,1);
                feature{r,c+3} = LDPsc(LDPsc(vein(ii:rrange+ii-1,jj:crange+jj-1),135,1),135,1);
                c = c + 4;
            end
        end
        c = 1;
        r = r + 1;
    end
end

%% Save Hasil
save ('featureC1.mat','feature');