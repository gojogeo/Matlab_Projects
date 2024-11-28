function updated_cordinate = cordinates_update(u,coord)
cord_disp = zeros(length(coord),2);
 for i = 1:2:length(u)
    j=(i/2)+0.5;
    cord_disp(j,1)=u(i);
    cord_disp(j,2)=u(i+1);
 end
 updated_cordinate = coord+cord_disp;

end