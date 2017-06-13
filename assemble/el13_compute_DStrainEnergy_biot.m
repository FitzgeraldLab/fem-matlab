function [dUs] = el13_compute_DStrainEnergy_biot(...
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
        
    % biot material
    [Psi, Sigma, Lambda] = svd(F);
    U = Lambda*Sigma*Lambda';
    Tr_U = Sigma(1,1)+Sigma(2,2)+Sigma(3,3);
    R = Psi*Lambda';
    Y = Tr_U*eye(3)-U;
    detY = det(Y);
    L = U-eye(3);
    Tr_L = L(1,1)+L(2,2)+L(3,3);
    G = lambda*Tr_L*eye(3) + 2*mu*L;
    S = U\G;    
    
    %% Compute the
    for k = 1:nee
        dF = [Nx(:,k),Ny(:,k),Nz(:,k)];
        dE = 1/2*(dF'*F + F'*dF);
        theta = R'*dF-1/detY*Y*(R'*dF-dF'*R)*Y*U;
        Tr_theta = theta(1,1)+theta(2,2)+theta(3,3);
        dS = (lambda*Tr_theta*eye(3)+2*mu*theta-S*theta)/U;
        
        integ(k) = 1/2*( sum(sum(S.*dE)) + sum(sum(dS.*Ee)) ); 
        
    end
    
        
    %% compute dV0
    dV0 = det_meshJ*quad_w(i1);
    
    %% Build Us
    dUs = dUs + integ*dV0;
    
end

