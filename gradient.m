
%% laplasyen
clear all, clc,close all
Iorj=imread('DIPXE.jpg');
   Iorj=imread('goruntu12.jpg');
f = double(Iorj);
[N M]=size(f);

% roberts
Mx=[-1 0;0 1];
My=[0 -1;1 0];

% %prewitt
% Mx=[-1 0 1;-1 0 1;-1 0 1];
% My=[-1 -1 -1;0 0 0;1 1 1];

% % Sobel
% Mx=[-1 0 1;-2 0 2;-1 0 1];
% My=[-1 -2 -1;0 0 0;1 2 1];
% 
gx=conv2(f,Mx,'same');
gy=conv2(f,My,'same');

aa=gx.^2;
bb=gy.^2;
y1 = sqrt(aa + bb);
%ikinci yol mutlak deðer ile gradient
y2= abs(gx)+abs(gy);

%% normalize
Qmaks=255; Qmin=0;
ymaks=max(max(y1));
ymin=min(min(y1));
beta = round(Qmaks-Qmin)./(ymaks-ymin);
Q1 = (beta*(y1-ymin)+Qmin);

%% normalize
Qmaks=255; Qmin=0;
ymaks=max(max(y2));
ymin=min(min(y2));
beta = round(Qmaks-Qmin)./(ymaks-ymin);
Q2 = (beta*(y2-ymin)+Qmin);

subplot(1,3,1),imshow(Iorj);
subplot(1,3,2),imshow(uint8(Q1));
subplot(1,3,3),imshow(uint8(Q2));
