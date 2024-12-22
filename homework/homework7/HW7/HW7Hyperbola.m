a=2;b=8;
p0=sqrt(2*a)+sqrt(b)*1i;
%该点切线与x轴的交点为a/x0=a/sqrt(2a)=sqrt(a)/sqrt(2)
p1=sqrt(a)/sqrt(2);
p2=sqrt(2*a)-sqrt(b)*1i;
w0=1;w1=1/(sqrt(2)-1)-1;w2=1;
f2=@(t)((1.-t).^2.*w0.*p0+2.*t.*(1.-t).*w1.*p1+t.^2.*w2.*p2)./((1.-t).^2.*w0+2.*t.*(1.-t).*w1+t.^2.*w2);
dominator=@(t)((1.-t).^2.*w0+2.*t.*(1.-t).*w1+t.^2.*w2);
s=0:0.01:1;

s1=1/2:-0.001:0;
s1=s1./(2.*s1-1);%-infty to 0
s2=1:-0.001:1/2;%1 to +infty
s2=s2./(2.*s2-1);
u1=dominator(s1);
u2=dominator(s2);
k=find(u1>0,1);
k2=find(u2<0,1);
   %s=0:0.001:1;
s=[s1(k:end),s,s2(1:k2-1)];
result=f2(s);
plot(result);
hold on;
s=[s2(k2:end),s1(1:k-1)];
plot(f2(s));
