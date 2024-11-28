function [u_bounds, x_opt] = optimised_withbounds(EA, nNode, nTruss,coord, conn, boundaryCond, force)
    x0 =ones(nTruss,1);
    lb = 0.1 * x0;
    ub = 2.0 * x0;
    targetnode = 2*force(1);
    objFun = @(x_opt)objectiveFunction(x_opt, EA, nNode, nTruss,coord, conn, boundaryCond, force, targetnode);

    x_opt = fmincon(objFun, x0, [], [], [], [], lb, ub, [], []);
    optimY= objFun(x_opt);
    EA_opt_bounds = x_opt .* EA;
    [u_bounds ~] = calcTrussStructure(EA_opt_bounds, nNode, nTruss, coord, conn, boundaryCond, force);
end

