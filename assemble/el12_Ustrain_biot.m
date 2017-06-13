function Ue = el12_Ustrain_biot(...
    X, qe, E, nu, ...
    quad_nt, quad_xi, quad_eta, quad_zeta, quad_w) %#codegen
% Biot-material Element
% {^(i)q}: previous state of q

%%
ned = 3;
nen_e = 27;
%nee = 81;

lambda = E*nu/(1+nu)/(1-2*nu);
mu = E/2/(1+nu);

%% initialize the matricies
Ue = 0;

%% Define Integration loop
for i1 = 1:quad_nt
    xi = quad_xi(i1);
    eta = quad_eta(i1);
    zeta = quad_zeta(i1);
    
    %% Get Shape Functions, and local derivatives
    [~,NNxi,NNeta,NNzeta] = el12_ShapeFunctions(xi,eta,zeta);
    
    %% Build [N]
    %N     = expand_shapeNN(NN    , nen_e, ned);
    Nxi   = expand_shapeNN(NNxi  , nen_e, ned);
    Neta  = expand_shapeNN(NNeta , nen_e, ned);
    Nzeta = expand_shapeNN(NNzeta, nen_e, ned);
    
    %% Compute Jacobian
    J = [Nxi*X, Neta*X, Nzeta*X];
    detJ = det(J);
    
    %% Derivative matrix DN
    DN = [NNxi', NNeta', NNzeta']/J;
    
    %% Build Nx, Ny, Nz
    Nx = expand_shapeNN(DN(:,1), nen_e, ned);
    Ny = expand_shapeNN(DN(:,2), nen_e, ned);
    Nz = expand_shapeNN(DN(:,3), nen_e, ned);
    
    %% Get the stress: {S} and [DS]
    F = [ Nx*qe, Ny*qe, Nz*qe ] + eye(3);
    Ee = 1/2*(F'*F-eye(3));
    
    % biot material
    [~, Sigma, Lambda] = svd(F);
    U = Lambda*Sigma*Lambda';
    L = U-eye(3);
    Tr_L = L(1,1)+L(2,2)+L(3,3);
    G = lambda*Tr_L*eye(3) + 2*mu*L;
    S = U\G;
    
    %% Compute the stress-strain work
    work = sum(sum(S.*Ee));
    
    %% compute dV0
    dV0 = detJ*quad_w(i1);
    
    %% Build Us
    Ue = Ue + 1/2*work*dV0;
end
