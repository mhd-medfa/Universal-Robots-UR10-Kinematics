# Universal-Robots-UR10-Kinematics

In this project, we try to implement FK, Jacobian function of the redundant robot UR10, and then we implement 3 different methods of calculating IK of the robot. 

Implement IK function for robot based on:
1. Weighted Pseudo-inverse
2. Damped Least Squares
3. Null space method with objective function H(q) which maximize distance from joint limits

Forward Kinematics model of robot
Direct kinematics is obtaining the homogeneous transformation matrix of the end of the kinematic chain, or in this case the end of the robot, in relation to the reference frame of the base. This homogeneous transformation matrix H is obtained as a multiplication of the successive matrices of homogeneous transformation of the reference systems of each robot link.

**The FK model of this robot is expressed by the equation**

`H=Tbase*Rz(q1)*Ty(L1)*Ry(q2)*Tz(L2)*Ry(q3)*Tz(L3)*Rz(q4)*Ty(L4)*Ry(q5)*Tz(L5)*Ry(q6)*Ty(L6)*Ttool`

