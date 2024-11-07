function A = updateA_withbearing(A,bearing)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[i j] = size(bearing);
for x = 1:i
    A(2*bearing(x,1)-(2-bearing(x,2)),x)=1;
end

end