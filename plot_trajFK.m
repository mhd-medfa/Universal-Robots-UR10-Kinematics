function [graphx, graphy, graphz]= plot_trajFK( q , L)
 pos0=[0 , 0, 0]';
%  H=Tbase*Ry(q(1))*Tz(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Rz(q(4))*Ry(q(5))*Ry(q(6))*Ttool;
 T=Ry(q(1))*Tz(L(1));
 pos1=T(1:3,4);
 
 T=Ry(q(1))*Tz(L(1))*Ry(q(2))*Tz(L(2));
 pos2=T(1:3,4);
 
 T=Ry(q(1))*Tz(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3));
 pos3=T(1:3,4);
 
 T=Ry(q(1))*Tz(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Rz(q(4));
 pos4=T(1:3,4);
 
 T=Ry(q(1))*Tz(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Rz(q(4))*Ry(q(5));
 pos5=T(1:3,4);
 
 T=Ry(q(1))*Tz(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Rz(q(4))*Ry(q(5))*Ry(q(6));
 pos6=T(1:3,4);
 
 
 graphx=[pos0(1),pos1(1),pos2(1),pos3(1),pos4(1),pos5(1),pos6(1)];
 graphy=[pos0(2),pos1(2),pos2(2),pos3(2),pos4(2),pos5(2),pos6(2)];
 graphz=[pos0(3),pos1(3),pos2(3),pos3(3),pos4(3),pos5(3),pos6(3)];
end