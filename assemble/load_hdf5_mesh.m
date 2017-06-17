function [x,y,z, IEN, ID, LM, nen, nel, nnp, neq, ng, ndofs, eltype, ...
    MatType, MatDensity, YoungsModulus, PossionRatio, Damping, ...
    ws_IEN, ws_nel, ws_eltype] ...
    = load_hdf5_mesh(hfile)

% load grid:
x = h5read(hfile,'/mesh/x');
y = h5read(hfile,'/mesh/y');
z = h5read(hfile,'/mesh/z');
nnp = double( h5read(hfile,'/mesh/nnp') );
nen = double( h5read(hfile,'/mesh/nen') );

IEN = double( h5read(hfile,'/body/IEN') );
ID = double( h5read(hfile,'/body/ID') );
LM = double(h5read(hfile,'/body/LM') );
nel = double(h5read(hfile,'/body/nel') );
eltype = double(h5read(hfile,'/body/eltype') );
MatType = double(h5read(hfile,'/body/MatType') );
MatDensity = h5read(hfile,'/body/MatDensity');
YoungsModulus = h5read(hfile,'/body/YoungsModulus');
PossionRatio = h5read(hfile,'/body/PoissonRatio');
Damping.flag = h5read(hfile,'/body/ProportionalDamping/flag');
% if( Damping.flag == 1 )
    Damping.kappa_M  = h5read(hfile,'/body/ProportionalDamping/kappa_M');
    Damping.kappa_K0 = h5read(hfile,'/body/ProportionalDamping/kappa_K0');
% end

neq = double(h5read(hfile,'/RestSurface/neq') );
ng = double(h5read(hfile,'/RestSurface/ng') );
ndofs = ng+neq;

ws_IEN = double( h5read(hfile,'/WetSurface/IEN') );
ws_nel = double( h5read(hfile,'/WetSurface/nel') );
ws_eltype = double( h5read(hfile,'/WetSurface/eltype') );

