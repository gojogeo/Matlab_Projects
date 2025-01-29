function res = postprocessing(res)

% =========================================================================
% =========================================================================
% Postprocessing

par = res.par;                                                  % Parameter 

% =========================================================================

L = par.L;                             % Auslesen der benoetigten Parameter 
a = par.a;

% =========================================================================

u = res.u;           % numerisch berechnete Loesung des Anfangswertproblems
t = res.t;           % uD = f(t, u),  u(0) = u0,      wobei u = [phi, phiD]

phi   = u(:, 1);                                    % Winkel
phiD  = u(:, 2);                                    % Winkelgeschwindigkeit
    
    %Resultate speichern
    res.phi = phi;  res.phiD = phiD;

% =========================================================================

X = (0:L/200:L).';
    
    % Resultat speichern
    res.X = X;
    
Y = (a:-2*a/40:-a).';

    % Resultat speichern
    res.Y = Y;

% =========================================================================

disp('postprocessing...');

% =========================================================================

% Transformation Polar nach Kartesisch (AUFGABE 2)
[x, y, xD, yD] = trafoPolarNachKartesisch(phi, phiD, par);

    % Resultate speichern
    res.x = x;      res.y = y;
    res.xD = xD;    res.yD = yD;

% Berechne Energien (AUFGABE 3)
 [T, V, E] = berechneEnergien(t, x, y, xD, yD, par);

    % Resultate speichern
    res.T = T;
    res.V = V;
    res.E = E;
    
% Berechne Stabkraft (AUFGABE 4)
[phiDD, xDD, yDD, Z, Zx, Zy] = berechneStabkraft(t, phi, phiD, par);

    % Resultate speichern
    res.phiDD = phiDD;
    res.xDD = xDD;
    res.yDD = yDD;
    res.Z = Z;
    res.Zx = Zx;
    res.Zy = Zy;
        
% Berechne Schnittgroessen (AUFGABE 5)
%XXX

    % Resultate speichern
    %XXX

% Berechne Spannungen (AUFGABE 6)
%XXX

    % Resultate speichern
    %XXX
    
% =========================================================================

% Externe Kraft
nt = length(t);
Fe  = zeros(nt, 1);     
for n = 1:nt
    
    Fe(n) = externeKraft(t(n), par);
    
end % for n

    % Resultate speichern
    res.Fe = Fe;

% =========================================================================
% =========================================================================

end % function
