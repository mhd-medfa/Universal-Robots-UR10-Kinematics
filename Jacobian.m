function J = Jacobian(q,L,Tbase,Ttool)
% H=Tbase*Rz(q(1))*Ty(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Tz(L(3))*Rz(q(4))*Ty(L(4))*...
%     Ry(q(5))*Tz(L(5))*Ry(q(6))*Ty(L(6))*Ttool;
H=FK(q,L,Tbase,Ttool);
R = H(1:3,1:3);

%1st column of Jacobian
J1p=Tbase*Rzd(q(1))*Ty(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Tz(L(3))*Rz(q(4))*Ty(L(4))*...
    Ry(q(5))*Tz(L(5))*Ry(q(6))*Ty(L(6))*Ttool;

J1r=J1p*[R^-1 zeros(3,1);0 0 0 1];
J1=Jcol(J1r);


%2nd column of Jacobian
J2p=Tbase*Rz(q(1))*Ty(L(1))*Ryd(q(2))*Tz(L(2))*Ry(q(3))*Tz(L(3))*Rz(q(4))*Ty(L(4))*...
    Ry(q(5))*Tz(L(5))*Ry(q(6))*Ty(L(6))*Ttool;
J2r=J2p*[R^-1 zeros(3,1);0 0 0 1];
J2=Jcol(J2r);


%3rd column of Jacobian
J3p=Tbase*Rz(q(1))*Ty(L(1))*Ry(q(2))*Tz(L(2))*Ryd(q(3))*Tz(L(3))*Rz(q(4))*Ty(L(4))*...
    Ry(q(5))*Tz(L(5))*Ry(q(6))*Ty(L(6))*Ttool;

J3r=J3p*[R^-1 zeros(3,1);0 0 0 1];
J3=Jcol(J3r);


%4th column of Jacobian
J4p=Tbase*Rz(q(1))*Ty(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Tz(L(3))*Rzd(q(4))*Ty(L(4))*...
    Ry(q(5))*Tz(L(5))*Ry(q(6))*Ty(L(6))*Ttool;

J4r=J4p*[R^-1 zeros(3,1);0 0 0 1];
J4=Jcol(J4r);


%5th column of Jacobian
J5p=Tbase*Rz(q(1))*Ty(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Tz(L(3))*Rz(q(4))*Ty(L(4))*...
    Ryd(q(5))*Tz(L(5))*Ry(q(6))*Ty(L(6))*Ttool;
J5r=J5p*[R^-1 zeros(3,1);0 0 0 1];
J5=Jcol(J5r);


%6th column of Jacobian
J6p=Tbase*Rz(q(1))*Ty(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Tz(L(3))*Rz(q(4))*Ty(L(4))*...
    Ry(q(5))*Tz(L(5))*Ryd(q(6))*Ty(L(6))*Ttool;

J6r=J6p*[R^-1 zeros(3,1);0 0 0 1];
J6=Jcol(J6r);


% Calculate the full Jacobian
J=[J1,J2,J3 ,J4,J5,J6];
end


