function boundary = boundary_condition(coord, bearing)
boundary = zeros(2*length(coord),1);
for i = 1:length(bearing)
    boundary(bearing(i,1)*2-2+bearing(i,2))=1;
end
