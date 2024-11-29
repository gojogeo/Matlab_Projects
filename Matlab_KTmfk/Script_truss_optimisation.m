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


 [u,x_opt] = optimised_withbounds(EA, A, S, nNode, nTruss, truss_rigid.coord, truss_rigid.conn,...
     truss_rigid.bearing, truss_rigid.F);
 new_corrd_opt = cordinates_update(u,truss_rigid.coord);
 truss_opt.bearing = boundaryCond;
 truss_opt.F=force;
 truss_opt.conn=conn;
 truss_opt.coord = new_corrd_opt;
 plottruss_optimised(truss_opt, x_opt);
 nonlin = @(x_opt)ConstraintFunction(x_opt, A, EA, S, nTruss);
    
 h1=plot(0,'Color','red','DisplayName','optimised');
 h2=plot(0,'Color','blue','DisplayName','deformed');
 h3=plot(0,'Color','black','DisplayName','rigid');
    
 legend([h1, h2, h3])







