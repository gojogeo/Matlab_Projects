function [I_Ibeam] = CalculateI_Ibeam(Base,Height,t_base,t_height)
b=Base-t_height;
h=Height-(2*t_base);
I_Ibeam = ((Base*(Height^3))-(b*(h^3)))/12;
end