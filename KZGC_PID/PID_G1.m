
clear;clc;
%取采样周期为0.05；则p=4.8时等幅震荡；增益Ks=1;周期Ts=0.72;取控制度为1.05，得T=0.014*Ts
p=40.8;
Ts=0.72;
KS=1;

T=0.014*Ts ;    %0.0101
Ti=0.49*Ts ;   %0.3528
Td=0.14*Ts ;  %0.1008

KP=0.63*KS      
KI=KP*T/Ti    
KD=KP*Td/T    



% ts=0.005;
% p=[1:5:10];
% s = tf('s'); 
% Gs = 2/(s^2+2*s);
% 
% for i=1:length(p)
% Gc=feedback(p(i)*Gs,1);
% step(Gc),hold on
% end;
% axis([0,10,0,2.3])
