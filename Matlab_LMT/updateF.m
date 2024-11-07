function F = updateF(F,ex_loading)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[i j] = size(ex_loading);
for x = 1:i
    F(2*ex_loading(x,1)-1)= ex_loading(x,2);
    F(2*ex_loading(x,1))= ex_loading(x,3);
end

end