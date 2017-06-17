function [eArea] = el9_compute_area(...
    Xe, qe, ...
    quad_nt, quad_xi, quad_eta, quad_w)
%#codegen

ned = 3;
nen_e = 6;
nee   = nen_e*ned;

eArea=0;% calculate the volume of the element
%% Define Integration loop
for i1 = 1:quad_nt
    xi = quad_xi(i1);
    eta = quad_eta(i1);
    
    %% Get Shape Functions, and local derivatives
    [~,NNxi,NNeta] = el9_ShapeFunctions(xi,eta);
    
    %% Build [N]
    %N     = expand_shapeNN(NN    , nen_e, ned);
    Nxi   = expand_shapeNN(NNxi  , nen_e, ned);
    Neta  = expand_shapeNN(NNeta , nen_e, ned);
    
    %% Build dA
    rxi = Nxi*(Xe+qe);
    reta = Neta*(Xe+qe);
    
    dA = norm( cross(rxi,reta), 2 )*quad_w(i1);
    
    %% Integrate
    eArea = eArea + dA;
end

