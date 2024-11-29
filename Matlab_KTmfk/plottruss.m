function plottruss(truss)
    
    hold on
    for i = 1: length(truss.conn)
        x = [truss.coord(truss.conn (i,1),1) truss.coord(truss.conn (i,2),1)];
        y = [truss.coord(truss.conn (i,1),2) truss.coord(truss.conn (i,2),2)];
        plot(x,y,'o-k', 'Color','black', 'LineWidth',1)
        xlabel = (x(1)+x(2))/2;
        ylabel = (y(1)+y(2))/2;
        text (xlabel,ylabel,string(i))
    end
    axis equal
    [i ~] = size(truss.bearing);

    for x = 1: i
        if truss.bearing(x,2) == 1
            plot(truss.coord(truss.bearing(x,1),1)-0.2,truss.coord(truss.bearing(x,1),2), '>',"Color","blue","LineWidth",1)
        elseif truss.bearing(x,2) == 2
            plot(truss.coord(truss.bearing(x,1),1),truss.coord(truss.bearing(x,1),2)-0.2, '^',"Color","blue","LineWidth",1)
        end
    end
    [l ~] = size(truss.F);
    for i =1 : l
        h2 = quiver (truss.coord(truss.F(i),1),truss.coord(truss.F(i),2),truss.F(i,2), truss.F(i,3),"Color", "red",'DisplayName','Forces');
        
    end
    grid on
    
    

end