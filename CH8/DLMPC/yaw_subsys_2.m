function [ omega_plus ] = yaw_subsys_2( omega,u,v,Fr,T )

x_wave=0;
y_wave=0;

% x_wave=0.2;
% y_wave=0.2;

rot_wave=0;

% System coefficients
%==========================================================================
m=116;
Iz=13.1;
X_udot=-167.6;
Y_vdot=-477.2;
N_rdot=-15.9;
Xu=26.9;
Yv=35.8;
Nr=3.5;
Du=241.3;
Dv=503.8;
Dr=76.9;

Mx=m-X_udot;
My=m-Y_vdot;
Mpsi=Iz-N_rdot;
%==========================================================================

x = omega(1);
y = omega(2);
psi = omega(3);
r = omega(4);

u_wave = x_wave*cos(psi) + y_wave*sin(psi);
v_wave = -x_wave*sin(psi) + y_wave*cos(psi);

x_dot=(u+u_wave)*cos(psi)-(v+v_wave)*sin(psi);
y_dot=(u+u_wave)*sin(psi)+(v+v_wave)*cos(psi);

% x_dot = u*cos(psi)-v*sin(psi);
% y_dot = u*sin(psi)+v*cos(psi);
psi_dot = r;
r_dot=((Mx-My)/Mpsi)*u*v-(Nr/Mpsi)*r-(Dr/Mpsi)*r*abs(r)+Fr/Mpsi;

omega_dot = [x_dot;y_dot;psi_dot;r_dot];
omega_plus = omega + omega_dot*T;


end

