function Ue = el13_Ustrain_kirch(...
    X, qe, E, nu, ...
    quad_nt, quad_xi, quad_eta, quad_zeta, quad_w) %#codegen
% Kirch-material Element
% {^(i)q}: previous state of q

%%
ned = 3;
nen_e = 18;
%nee = 54;

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
    [~,NNxi,NNeta,NNzeta] = el13_ShapeFunctions(xi,eta,zeta);
    
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
    S = lambda*(Ee(1,1)+Ee(2,2)+Ee(3,3))*eye(3) + 2*mu*Ee;
    
    %% Compute the stress-strain work
    work = sum(sum(S.*Ee));
    
    %% compute dV0
    dV0 = detJ*quad_w(i1);
    
    %% Build Us
    Ue = Ue + 1/2*work*dV0;
end
