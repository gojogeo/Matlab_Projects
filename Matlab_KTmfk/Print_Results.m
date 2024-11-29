function Print_Results(x_opt, EA, nNode, nTruss, coord, conn, boundaryCond, force, targetNode)
    
    EA_scaled = x_opt .* EA; 
    
    
    [u, S] = calcTrussStructure(EA_scaled, nNode, nTruss, coord, conn, boundaryCond, force);
    
    
    yDOF =  targetNode; 
    
   
    Y = abs(u(yDOF))
    EA_scaled
    u
    x_opt

   
end
