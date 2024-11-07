function A = updateA_withtension(A, cordinates, connectivity,a)
[conx cony] = size(connectivity);
[corx cory] = size(cordinates);
for i = 1: conx
    
    node1 = connectivity(i,1);
    node2 = connectivity(i,2);
    ang1 = atan2(cordinates(node2,2)-cordinates(node1,2),cordinates(node2,1)-cordinates(node1,1));
    ang2 = atan2(cordinates(node1,2)-cordinates(node2,2),cordinates(node1,1)-cordinates(node2,1));
    A(2*node1-1,i+a)=cos(ang1);
    A(2*node1,i+a)=sin(ang1);
    A(2*node2-1,i+a)=cos(ang2);
    A(2*node2,i+a)=sin(ang2);
    
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
end
end