T = load(uigetfile);
[k , ~]=size(T.coord);
[f , ~]=size(T.conn);
[a, ~]=size(T.bearing);
plottruss(T)
if 2*k-(a+f) == 0
    A_mat = zeros(2*k,a+f);
    F_mat = zeros(2*k,1);
    A_mat = updateA_withbearing(A_mat,T.bearing);
    A_mat = updateA_withtension (A_mat, T.coord, T.conn, a);
    F_mat = updateF(F_mat, T.F);
    Sol = -1*(inv(A_mat)*F_mat);
    plottruss_results(T,Sol,a)
else
    error('Truss is not statically determined')
end


