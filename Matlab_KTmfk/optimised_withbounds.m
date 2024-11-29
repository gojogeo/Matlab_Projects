function [u_bounds, x_opt] = optimised_withbounds(inputparam)
    
    EA = inputparam.EA;
    nNode=inputparam.nNode;
    nTruss = inputparam.nTruss;
     coord =inputparam.coord;
     conn = inputparam.conn ;
     boundaryCond =inputparam.boundaryCond;
     force = inputparam.force;
     A = inputparam.A ;
     B = inputparam.B ;
     Aequ = inputparam.Aequ ;
     Bequ = inputparam.Bequ ;
     lb = inputparam.lb; 
     ub = inputparam.ub ;
     nonlcon = inputparam.nonlcon ;
     options = inputparam.options;
     x0 =ones(nTruss,1);
    targetnode = 2*force(1);
    objFun = @(x_opt)objectiveFunction(x_opt, EA, nNode, nTruss,coord, conn, boundaryCond, force, targetnode);
    x_opt = fmincon(objFun, x0, A, B, Aequ , Bequ, lb, ub, nonlcon, options);
    optimY= objFun(x_opt);
    EA_opt_bounds = x_opt .* EA;
    [u_bounds ~] = calcTrussStructure(EA_opt_bounds, nNode, nTruss, coord, conn, boundaryCond, force);
end

