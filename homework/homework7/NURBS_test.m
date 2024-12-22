q0=[1,0];
q1=[1,2-sqrt(2)];
q12=[1,1];
q2=[2-sqrt(2),1];
q3=[0,1];
q4=[-1/3,1];
q5=[-2/3,1];
q6=[-1,1];
q7=[-2,1];
q8=[-2,0];
q9=[-2,-1];


arc_w=[1,(1+sqrt(2))/3,(1+sqrt(2))/3,1];
arc_t=0:0.01:1;
arc_p=[q0;q1;q2;q3];
arc_3d=Rational_Bezier_Spline(arc_p,arc_w,arc_t);
arc=arc_3d(:,:)./arc_3d(:,3);
plot(arc(:,1),arc(:,2),'r', 'linewidth', 2);
hold on;
%{
theta=0:0.01:1/2;
x=cos(theta*pi);
y=sin(theta*pi);
plot(x,y,'g','LineWidth',2);
hold on;
%}


line_w=[1,1,1,1];
line_p=[q3;q4;q5;q6];
line_t=1:0.01:2;
line_3d=Rational_Bezier_Spline(line_p,line_w,line_t);
line=line_3d(:,:)./line_3d(:,3);
plot(line(:,1),line(:,2),'g', 'linewidth', 2);
hold on;

bezier_w=[1,1,1,1];
bezier_p=[q6;q7;q8;q9];
bezier_t=2:0.01:3;
bezier_3d=Rational_Bezier_Spline(bezier_p,bezier_w,bezier_t);
bezier=bezier_3d(:,:)./bezier_3d(:,3);
plot(bezier(:,1),bezier(:,2),'b', 'linewidth', 2);
hold on;

plot(-15/8,3/8,'o');

%{
arc_w1=[1,sqrt(2)/2,1];
arc_t1=0:0.01:1;
arc_p1=[q0;q12;q3];
arc_3d1=Rational_Bezier_Spline(arc_p1,arc_w1,arc_t1);
arc1=arc_3d1(:,:)./arc_3d1(:,3);
plot(arc1(:,1),arc1(:,2),'r', 'linewidth', 2);
%}