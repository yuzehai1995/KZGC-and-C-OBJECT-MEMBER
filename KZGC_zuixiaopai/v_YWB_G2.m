
%Gs=2*e^-s/(s+2),��λ�ٶ���Ӧ

clc;clear;
z=[];  p=[-2];  k=2;
T=0.5;
Gs=zpk(z,p,k);
Gz0=c2d(Gs,T,'zoh');%����ױ��������Gz

[z,p,k]=zpkdata(Gz0); %��� G(z)�ļ��㣬��㼰����
Gz0=zpk(z,p,k,T,'variable','z^-1'); %ת�� Gz Ϊ�㼫������ģ�Ͱ� z-1 ��ʽ����



syms z a0 a1
Gz=0.63212 *(z^-3)/(1-0.3679*z^-1);

%d=3;q=2; M- = 1�� N- = 1 �� N0- = 1; n- = 0 ;n0- = 0  m- = 0;j=0(��λԲ�ϼ���);
Gcz=z^-3*(a0+a1*z^-1); %����õ�
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

[Nc,Dc]=numden(simplify(Gcz));  %����Gcz���ֱ�ȡ���ӷ�ĸ
numc=sym2poly(Nc);              %ȡ����
denc=sym2poly(Dc);
[Nu,Du]=numden(simplify(Guz));
numu=sym2poly(Nu);
denu=sym2poly(Du);
t=0:T:10*T;
u=t;                      %����Ϊt ��t^2/2
hold on
dlsim(numc,denc,u);            %    dlsim(NUM,DEN,U) plots the time response of the transfer function
                               % description  G(z) = NUM(z)/DEN(z)  where NUM and DEN contain the 
                               % polynomial coefficients in descending powers of z
dlsim(numu,denu,u);
hold off




