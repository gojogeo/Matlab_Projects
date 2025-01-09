syms E My Iyy x w(x) b h F l C1 C2
Iyy = b*h^3/12*(2-x/1000);
My = F*(l-x);
dw2_dx2 = My/(E*Iyy);
dw_dx = int(dw2_dx2, x) + C1;
C1 = solve(subs(dw_dx, x, 0)==0, C1);
subs(dw_dx);
w = int(dw_dx, x)+C2;
C2 = solve(subs(w, x, 0)==0,C2);
w = subs(w);

beam.F = 1000;            % Force in N
beam.h = 25e-3;           % Beam height in meters (convert from mm)
beam.b = 15e-3;           % Beam width in meters (convert from mm)
beam.E = 210e9;           % E-Modulus in Pa (GPa to Pa conversion)
beam.l = 1000e-3;         % Length of the beam in meters (convert from mm)
beam.x = (0:1000)*1e-3;   % Position vector x in meters

w_numeric = subs(w, {F, l, b, h, E}, {beam.F, beam.l, beam.b, beam.h, beam.E});
w_handle = matlabFunction(real(w_numeric), 'Vars', x);
w_values = w_handle(beam.x);
w_values_mm = w_values * 1e3; % Convert deflection from meters to mm

figure;
plot(beam.x * 1e3, w_values_mm, 'LineWidth', 1.5); % x in mm, w in mm
xlabel('Position x (mm)');
ylabel('Deflection w(x) (mm)');
title('Bending Line of the Beam');
grid on;








