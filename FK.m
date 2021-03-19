function H= FK(q , L ,Tbase,Ttool)


% H=Tbase*Tz(L(1))*Rz(q(1))*Tz(L(2))*Rx(q(2))*Tz(L(3))*Rz(q(3))*Tz(L(4))*Rx(q(4))*Tz(L(5))*...
%     Rz(q(5))*Tz(L(6))*Rx(q(6))*Tz(L(7))*Rz(q(7))*Ttool;

% H=          Tbase*Ry(q(1))*Tz(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Rz(q(4))*Ry(q(5))*Ry(q(6))*Ttool;
H=Tbase*Rz(q(1))*Ty(L(1))*Ry(q(2))*Tz(L(2))*Ry(q(3))*Tz(L(3))*Rz(q(4))*Ty(L(4))*...
    Ry(q(5))*Tz(L(5))*Ry(q(6))*Ty(L(6))*Ttool;
end