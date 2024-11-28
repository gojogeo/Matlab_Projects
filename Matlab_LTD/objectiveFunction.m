function Y = objectiveFunction(x_opt, EA, nNode, nTruss, coord, conn, boundaryCond, force, targetNode)
    % Scale the tensile stiffnesses of the truss elements
    EA_scaled = x_opt .* EA; % Element stiffness after scaling
    
    % Calculate the displacements using the calcTrussStructure function
    [u, ~] = calcTrussStructure(EA_scaled, nNode, nTruss, coord, conn, boundaryCond, force);
    
    % Identify the degree of freedom corresponding to the y-displacement
    % of the target node
    yDOF = 2 * targetNode; % y-DOF for the target node is the second DOF (2*n - 1 is x, 2*n is y)
    
    % Extract the y-displacement at the target node
    Y = abs(u(yDOF)); % Function value to be minimized
    
    % Note: Y is positive for downward displacement. You may negate it if
    % you want to minimize upward displacement instead.
end
