function force = force_matrix(coord,F)
force = zeros(2*length(coord),1)
[l ~]=size(F)
for i = 1:l
    force(F(i,1)*2-1)=F(i,2)
    force(F(i,1)*2)=F(i,3)

    
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

end