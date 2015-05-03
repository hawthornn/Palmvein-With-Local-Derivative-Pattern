%% Source Code Tugas Akhir Skenario D (Akhmad Faizal Akbar 1103110183)
% Dataset CASIA Menggunakan 850nm tangan kiri

%% Deskripsi Skenario D
% Order = 3 dan Scale = 1 sampai 6
% Plam(Telapak Tangan)
% Seluruh Telapak Tangan
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
        
        feature{r,c} = LDPsc(LDPsc(vein,0,1),0,1);
        feature{r,c+1} = LDPsc(LDPsc(vein,45,1),45,1);
        feature{r,c+2} = LDPsc(LDPsc(vein,90,1),90,1);
        feature{r,c+3} = LDPsc(LDPsc(vein,135,1),135,1);
        
        c = 1;
        r = r+1;
    end
end

%% Save Hasil
save ('featureD1.mat','feature');