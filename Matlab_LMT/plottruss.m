function plottruss(cordinates, connectivity)
    hold on
    for i = 1: length(connectivity)
        x = [cordinates(connectivity (i,1),1) cordinates(connectivity (i,2),1)];
        y = [cordinates(connectivity (i,1),2) cordinates(connectivity (i,2),2)];
        plot(x,y)
    end
    axis equal
    hold off

end