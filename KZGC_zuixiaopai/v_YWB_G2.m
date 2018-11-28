
%Gs=2*e^-s/(s+2),单位速度响应

clc;clear;
z=[];  p=[-2];  k=2;
T=0.5;
Gs=zpk(z,p,k);
Gz0=c2d(Gs,T,'zoh');%加零阶保持器后的Gz

[z,p,k]=zpkdata(Gz0); %求出 G(z)的极点，零点及增益
Gz0=zpk(z,p,k,T,'variable','z^-1'); %转换 Gz 为零极点增益模型按 z-1 形式排列



syms z a0 a1
Gz=0.63212 *(z^-3)/(1-0.3679*z^-1);

%d=3;q=2; M- = 1； N- = 1 ； N0- = 1; n- = 0 ;n0- = 0  m- = 0;j=0(单位圆上极点);
Gcz=z^-3*(a0+a1*z^-1); %计算得到
f1=subs(Gcz,z,1)-1; 
f2=subs(diff(Gcz,1),z,1);
[a0j,a1j]=solve(f1,f2) ;
Gcz=subs(Gcz,[a0 a1 ],[a0j a1j ]);
Gez=1-Gcz;


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




