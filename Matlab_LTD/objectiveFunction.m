function Y = objectiveFunction(x_opt, EA, nNode, nTruss, coord, conn, boundaryCond, force, targetNode)
    
    EA_scaled = x_opt .* EA; 
    
    
    [u, ~] = calcTrussStructure(EA_scaled, nNode, nTruss, coord, conn, boundaryCond, force);
    
    
    yDOF = 2 * targetNode; 
    
   
    Y = abs(u(yDOF)); 
end
