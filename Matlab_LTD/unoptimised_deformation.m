 truss.bearing = boundaryCond;
 truss.F=force;
 truss.conn=conn;
 truss.coord = coord;
 
 plottruss(truss,"undeformed", "black");
 hold on;
 A=zeros(length(conn),1);
 for i = 1:length(A)
    A(i)=1;
 end
 EA=2.1e5*A;
 [nNode ~]=size(coord);
 [nTruss ~]=size(conn);
 [u,S]=calcTrussStructure(EA, nNode, nTruss, coord, conn, boundaryCond, force);
 cord_disp = zeros(length(coord),2);
 for i = 1:2:length(u)
    j=(i/2)+0.5;
    cord_disp(j,1)=u(i);
    cord_disp(j,2)=u(i+1);
 end
 cord_disp = cord_disp*1000;
 new_corrd = coord+cord_disp;
 truss.coord = new_corrd;
 
 plottruss(truss, "unoptimised", "green");

 u = optimised_withbounds(EA, nNode, nTruss, coord, conn, boundaryCond, force);

 cord_disp = zeros(length(coord),2);
 for i = 1:2:length(u)
    j=(i/2)+0.5;
    cord_disp(j,1)=u(i);
    cord_disp(j,2)=u(i+1);
 end
 cord_disp = cord_disp*1000;
 new_corrd = coord+cord_disp;
 truss.coord = new_corrd;
 
 plottruss(truss, "optimised", "red");







