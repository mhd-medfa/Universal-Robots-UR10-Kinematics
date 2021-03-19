function q_updated = Null_Space (q,L, weights,p_goal,k)
q_updated=q;
p_curr= FK(q_updated,L, eye(4),eye(4));
p_curr= [p_curr(1:3,4); [0,0,0]'];
err=p_goal-p_curr;
I_m=ones(6,6);
q_max = [170, 170, 170, 170, 170, 170];
q_min = [-170, -170, -170, -170, -170, -170];

while (abs(sqrt(sum(err(1:3).^2)))>0.05)
%     disp(abs(sqrt(sum(err(1:3).^2))))
    jacob=Jacobian(q_updated,L, eye(4),eye(4));
    del_err= err/k; %k is a coeffecient that reduces amplitude for small values
%     H0=sqrt(det(jacob*jacob'));
    N=6;
    H0 = sum(((q_updated - mean(q_updated))./(q_max - q_min)).^2)/(2*N);
    delta_q=0.001;
%     dq0_now=zeros(6,1);

    qq_now=q_updated;
    qq_now(3)=qq_now(3)+delta_q;
        
%         jac_now=Jacobian(qq_now,L, eye(4),eye(4));
%         H_now=sqrt(det(jac_now*jac_now'));
    H_now = sum(((qq_now - mean(qq_now))./(q_max - q_min)).^2)/(2*N);
    dq0_now=((H_now-H0)/delta_q)';
    
    
    J_WPI=(pinv(weights)*jacob')*pinv(jacob*pinv(weights)*jacob');% 7x6

    del_q=J_WPI*del_err + (I_m-J_WPI*jacob)*dq0_now;
    
    q_updated=q_updated+del_q;
    
    p_curr=FK(q_updated,L, eye(4),eye(4));
    p_curr= [p_curr(1:3,4); [0,0,0]'];
    err=p_goal-p_curr;
    
end    
        
end