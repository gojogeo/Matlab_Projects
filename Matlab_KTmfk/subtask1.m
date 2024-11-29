 load("V4_Input_TrussStructure.mat");
 truss_rigid.bearing = boundaryCond;
 truss_rigid.F=force;
 truss_rigid.conn=conn;
 truss_rigid.coord = coord;
 plottruss(truss_rigid);
 hold on;
 w = 5
 h = 5
 A=(w*h)*ones(length(conn),1);
 E =3;
 EA=E*A;
 [nNode ~]=size(truss_rigid.coord);
 [nTruss ~]=size(truss_rigid.conn);
 
 [u,S]=calcTrussStructure(EA, nNode, nTruss, truss_rigid.coord, truss_rigid.conn,...
     truss_rigid.bearing, truss_rigid.F);
 new_corrd = cordinates_update(u,truss_rigid.coord);
 truss_unopt.bearing = boundaryCond;
 truss_unopt.F=force;
 truss_unopt.conn=conn;
 truss_unopt.coord = new_corrd;  
 plottruss_nonoptimised(truss_unopt);
 title('Subtask 1')
 h1=plot(0,'Color','black','DisplayName','undeformed');
 h2=plot(0,'Color','blue','DisplayName','deformed');
 legend([h1, h2])