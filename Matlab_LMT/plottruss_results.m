function plottruss_results(truss,Sol,a)
    hold on
    for i = 1: length(Sol)
        if Sol(i)> 1e-15
            colorm(i) = "green";
            legnd(i) = "tension";
        elseif Sol(i)< -(1e-15)
            colorm(i) = "red";
            legnd(i) = "compression";
        else
            colorm(i) = "blue";
            legnd(i) = "neutral";
        end
    end
    [i ~] = size(truss.bearing);

    for x = 1: i
        if truss.bearing(x,2) == 1
            plot(truss.coord(truss.bearing(x,1),1)-0.2,truss.coord(truss.bearing(x,1),2), '>',"Color","black","LineWidth",1)
        elseif truss.bearing(x,2) == 2
            plot(truss.coord(truss.bearing(x,1),1),truss.coord(truss.bearing(x,1),2)-0.2, '^',"Color","black","LineWidth",1)
        end
    end
    for i = 1: length(truss.conn)
        x = [truss.coord(truss.conn (i,1),1) truss.coord(truss.conn (i,2),1)];
        y = [truss.coord(truss.conn (i,1),2) truss.coord(truss.conn (i,2),2)];
        plot(x,y,'o-k', 'Color',colorm(i+a))
        xlabel = (x(1)+x(2))/2;
        ylabel = (y(1)+y(2))/2;
        text (xlabel,ylabel,string(i))
        
    end
    axis equal
    legend('truss')
    % for i = 1: length(truss.coord)
    %     text(truss.coord(i,1),truss.coord(i,2),string(i))
    % end
    [l ~] = size(truss.F);
    for i =1 : l
        quiver (truss.coord(truss.F(i),1),truss.coord(truss.F(i),2),truss.F(i,2), truss.F(i,3),"Color", "Black")
        legend('off')
        
    end
    grid on
    h1=plot(0,'-g','DisplayName','Tension');
    h2=plot(0,'-b','DisplayName','Neutal');
    h3=plot(0,'-r','DisplayName','Compression');
    %h4=plot(0,'-k','DisplayName','Forces');
    legend([h1, h2, h3])
    
    hold off

end