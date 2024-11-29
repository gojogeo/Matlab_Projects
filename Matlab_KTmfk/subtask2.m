 load("V4_Input_TrussStructure.mat"); 
 truss_rigid.bearing = boundaryCond;
 truss_rigid.F=force;
 truss_rigid.conn=conn;
 truss_rigid.coord = coord;
 plottruss(truss_rigid);
 hold on;
 w = 5;
 h = 5;
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
 x0 =ones(nTruss,1);
 lb = 0.01*x0;
 ub = 5*x0;
 inputparam.EA =EA;
 inputparam.nNode =nNode;
 inputparam.nTruss =nTruss;
 inputparam.coord =truss_rigid.coord;
 inputparam.conn =truss_rigid.conn;
 inputparam.boundaryCond =truss_rigid.bearing;
 inputparam.force =truss_rigid.F;
 inputparam.A =[];
 inputparam.B =[];
 inputparam.Aequ =[];
 inputparam.Bequ =[];
 inputparam.lb =lb;
 inputparam.ub =ub;
 inputparam.nonlcon =[];
 inputparam.options =[];
 targetnode = 2*force(1);




 [u,x_opt] = optimised_withbounds(inputparam);
 new_corrd_opt = cordinates_update(u,truss_rigid.coord);
 truss_opt.bearing = boundaryCond;
 truss_opt.F=force;
 truss_opt.conn=conn;
 truss_opt.coord = new_corrd_opt;
 plottruss_optimised(truss_opt, x_opt);
  h1=plot(0,'Color','red','DisplayName','optimised');
 h2=plot(0,'Color','blue','DisplayName','deformed');
 h3=plot(0,'Color','black','DisplayName','undeformed');
 title('Subtask 2')   
 legend([h1, h2, h3])
