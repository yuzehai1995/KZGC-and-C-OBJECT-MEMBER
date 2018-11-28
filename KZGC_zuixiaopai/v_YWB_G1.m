
%Gs=2/s/(s+2),单位速度响应

clc;clear;
z=[];  p=[0 -2];  k=2;
T=0.5;
Gs=zpk(z,p,k);
Gz=c2d(Gs,T,'zoh');

[z,p,k]=zpkdata(Gz); %求出 G(z)的极点，零点及增益
Gz=zpk(z,p,k,T,'variable','z^-1'); %转换 Gz 为零极点增益模型按 z-1 形式排列

zz=z;
pp=p;

syms z
Gz=0.18394*z^-1 *(1+0.7183*z^-1)/(1-z^-1)/(1-0.3679*z^-1);

%d=1;q=2; M- = 1； N- = (1-z^-1) ； N0- = 1; n- = 1 ;n0- = 0  m- = 0;j=1(单位圆上极点);
Gcz=z^-1*(2-1*z^-1); %计算得到
Gez=(1-z^-1)^2*(1);
Guz=Gcz/Gz;
Dz=Gcz/Gz/Gez;
[N,D]=numden(simplify(Dz));
numdy=sym2poly(N);
dendy=sym2poly(D);

[Nc,Dc]=numden(simplify(Gcz));  %化简Gcz并分别取分子分母
numc=sym2poly(Nc);              %取分子
denc=sym2poly(Dc);
[Nu,Du]=numden(simplify(Guz));
numu=sym2poly(Nu);
denu=sym2poly(Du);
t=0:T:10*T;
u=t;                      %输入为t 或t^2/2
hold on
dlsim(numc,denc,u);            %    dlsim(NUM,DEN,U) plots the time response of the transfer function
                               % description  G(z) = NUM(z)/DEN(z)  where NUM and DEN contain the 
                               % polynomial coefficients in descending powers of z
dlsim(numu,denu,u);
hold off




