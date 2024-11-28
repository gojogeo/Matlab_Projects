function k = k_local(n1,n2,coord,EA)

    x1 = coord(n1, 1);
    y1 = coord(n1, 2);
    x2 = coord(n2, 1);
    y2 = coord(n2, 2);

    L = sqrt((x2 - x1)^2 + (y2 - y1)^2); % Length of the element
    C = (x2 - x1) / L; % Cosine of the angle
    S = (y2 - y1) / L; % Sine of the angle

    k = (EA / L) * ...
            [ C^2,  C*S, -C^2, -C*S;
              C*S,  S^2, -C*S, -S^2;
             -C^2, -C*S,  C^2,  C*S;
             -C*S, -S^2,  C*S,  S^2];
end