function [dUs] = el13_compute_DStrainEnergy_kirch(...
    Xe, qe, E, nu, ...
    quad_nt, quad_xi, quad_eta, quad_zeta, quad_w)
%#codegen

ned = 3;
nen_e = 18;
nee   = nen_e*ned;


lambda = E*nu/(1+nu)/(1-2*nu);
mu = E/2/(1+nu);

dUs = zeros(nee,1);
integ = zeros(nee,1);

%% Define Integration loop
for i1 = 1:quad_nt
    xi = quad_xi(i1);
    eta = quad_eta(i1);
    zeta = quad_zeta(i1);
    
    %% Get Shape Functions, and local derivatives
    [~,NNxi,NNeta,NNzeta] = el13_ShapeFunctions(xi,eta,zeta);
    
    %% Build [N]
    %N     = expand_shapeNN(NN    , nen_e, ned);
    Nxi   = expand_shapeNN(NNxi  , nen_e, ned);
    Neta  = expand_shapeNN(NNeta , nen_e, ned);
    Nzeta = expand_shapeNN(NNzeta, nen_e, ned);
    
    %% Compute mesh Jacobian
    meshJ = [Nxi*Xe, Neta*Xe, Nzeta*Xe];
    det_meshJ = det(meshJ);
    
    %% Derivative matrix DN
    DN = [NNxi', NNeta', NNzeta']/meshJ;
    
    %% Build Nx, Ny, Nz
    Nx = expand_shapeNN(DN(:,1), nen_e, ned);
    Ny = expand_shapeNN(DN(:,2), nen_e, ned);
    Nz = expand_shapeNN(DN(:,3), nen_e, ned);
    
    %% Compute the stress [S] and Strain [E]
    F = [ Nx*qe, Ny*qe, Nz*qe ] + eye(3);
    Ee = 1/2*(F'*F-eye(3));
    
    % Kirchoff Material
    S = lambda*(Ee(1,1)+Ee(2,2)+Ee(3,3))*eye(3) + 2*mu*Ee;
    
    
    %% Compute the derivative
    for k = 1:nee
        dF = [Nx(:,k),Ny(:,k),Nz(:,k)];
        dE = 1/2*(dF'*F + F'*dF);
        integ(k) = sum(sum(S.*dE));        
    end
    
    %% compute dV0
    dV0 = det_meshJ*quad_w(i1);
    
    %% Build dUs
    dUs = dUs + integ*dV0;
    
end



