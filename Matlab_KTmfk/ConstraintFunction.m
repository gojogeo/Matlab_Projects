function [c, cequ] = ConstraintFunction(x_opt, A, EA, S, nTruss, stiffness, stress)
EA_scaled = x_opt .* EA;
A_scaled = x_opt .* A;
cequ = sum(EA_scaled)-stiffness;
c = abs(S'./A_scaled) - stress*ones(nTruss,1);
end