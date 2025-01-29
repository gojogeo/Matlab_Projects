function [phiDD, xDD, yDD, Z, Zx, Zy] = berechneStabkraft(t, phi, phiD, par)

% (AUFGABE 4)
% =========================================================================
% =========================================================================
% Parameter auslesen

m = par.m;
h = par.h;
b = par.b;
l = par.l;
g = par.g;
d = par.d;

% =========================================================================
% Speicherplatz allokieren

N = length(t);

% Beschleunigungen
phiDD = zeros(N ,1);
xDD = zeros(N, 1);
yDD = zeros(N, 1);

% Stabkraft
Zx = zeros(N, 1);
Zy = zeros(N, 1);

% Radialkomponente Z der Stabkraft
Z = zeros(N ,1);

disp('berechne Stabkraft');

% =========================================================================
% Berechnung von phiDD, xDD, yDD, Zx und Zy zu jedem Zeitschritt

for n = 1:N
    
    Fe = externeKraft(t(n), par);
    syms phi_DD x_DD y_DD Z_x Z_y
    eqn1 = (m*l^2)*phi_DD == (-m*g*l*sin(phi(n)))-(d*(l^2)*phiD(n))+(Fe*l);
    eqn2 = (-l*cos(phi(n)))*phi_DD + x_DD == -l*(phiD(n)^2)*sin(phi(n));
    eqn3 = (-l*sin(phi(n)))*phi_DD + y_DD == l*(phiD(n)^2)*cos(phi(n));
    eqn4 = m*x_DD - Z_x == (-d*l*phiD(n)*cos(phi(n)))+Fe*cos(phi(n));
    eqn5 = m*y_DD - Z_y == (-m*g)-(d*l*phiD(n)*sin(phi(n)))+Fe*sin(phi(n));
    
    %[A, Y] = equationsToMatrix([eqn1, eqn2, eqn3, eqn4, eqn5],[phi_DD, x_DD, y_DD, Z_x, Z_y]);

    %A = [XXX];
    
    %Y = [XXX];
    
    %X = linsolve(A,Y);
    sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5],[phi_DD, x_DD, y_DD, Z_x, Z_y]);
    % Beschleunigungen
    phiDD(n) = sol.phi_DD;
    xDD(n) = sol.x_DD;
    yDD(n) = sol.y_DD;  
    
    % Zwangskraftkomponenten
    Zx(n) = sol.Z_x;
    Zy(n) = sol.Z_y;
    
    % Berechne Radialkomponente Z der Stabkraft
    Z(n) = sqrt(sol.Z_x^2 + sol.Z_y^2);
    
end % for n

% =========================================================================
% =========================================================================

end % function

