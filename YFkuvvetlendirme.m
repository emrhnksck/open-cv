
%% YFKuvvetlendirme
clear all, clc,close all
Iorj=imread('goruntu10.jpg');
Iorj = rgb2gray(Iorj);
I = double(Iorj);
c = 2;
h = [ 0  -1   0;...
     -1 c+4 -1;...
     0  -1   0];
fhb = conv2(I,h,'same');


% Qmaks=255;Qmin=0;
% Imaks=max(max(fhb));Imin=min(min(fhb));
% beta=(Qmaks-Qmin)./(Imaks-Imin);
% fnhb=round(beta*(fhb-Imin)+Qmin);
%% plot
subplot(1,2,1),imshow(Iorj);
subplot(1,2,2),imshow(uint8(fhb))







