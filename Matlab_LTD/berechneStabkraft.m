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
    
    Fe = XXX;
        
    A = [
        XXX
        ];
    
    Y = [
        XXX
        ];
    
    X = XXX;
    
    % Beschleunigungen
    phiDD(n) = XXX;
    xDD(n) = XXX;
    yDD(n) = XXX;  
    
    % Zwangskraftkomponenten
    Zx(n) = XXX;
    Zy(n) = XXX;
    
    % Berechne Radialkomponente Z der Stabkraft
    Z(n) = XXX;
    
end % for n

% =========================================================================
% =========================================================================

end % function

