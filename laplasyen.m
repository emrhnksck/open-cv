
%% laplasyen
clear all, clc,close all,warning off
% %% kalip secimi
h = [0 1 0;1 -4 1;0 1 0];
 h = -h;
% % basitlestirme
% h = [0 -1 0; -1 5 -1;0 -1 0];
%  c=2;
%  h = [0 -1 0;-1 c+4 -1;0 -1 0];
% n1=1; h = ones(2*n1+1,2*n1+1); h(2,2 )= -8; h = -h;
Iorj=imread('moon.tif');
% Iorj=imread('retina.jpg');
%    Iorj=imread('goruntu4.tif');
%    Iorj=rgb2gray(imread('goruntu10.jpg'));
 I = double(Iorj);
y1 = conv2(I,h,'same');

% [N M]=size(I);
% B(1:N+2*n1,1:M+2*n1) = zeros;
% [Nb Mb]=size(B);
% B(n1+1:Nb-n1,n1+1:Mb-n1) = I;
% 
% [nmr nmc] = size(h);
% nyr = Nb-nmr+1;
% nyc = Mb-nmc+1;
% y1=zeros(nyr,nyc);
% 
% for yr=1:nyr
%     for yc=1:nyc
%         sum=0;
%         for mr=1:nmr
%             for mc=1:nmc
%                 sum = sum + B(yr-mr + nmr,yc-mc + nmc).*h(mr,mc);
%             end
%         end
%         y1(yr,yc) = sum;
%     end
% end
%% normalize
Qmaks=255; Qmin=0;
ymaks=max(max(y1));
ymin=min(min(y1));
beta = round(Qmaks-Qmin)./(ymaks-ymin);
Q = (beta*(y1-ymin)+Qmin);

subplot(1,3,1),imshow(Iorj);title('orjinal görüntü')
subplot(1,3,2),imshow(uint8(y1));title('laplasyen görüntü')
subplot(1,3,3),imshow(uint8(Q));title('ölçeklendirilmiþ görüntü')

T = plus(I,y1);
figure,imshow(Iorj),figure,imshow(uint8(T))

