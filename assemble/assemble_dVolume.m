function [dVolume,Volume] = assemble_dVolume(...
    LM, IEN, ID, ned, nnp, nen, nel, eltype,...
    quad_rules, x, y, z, qi)

%%
ndof = ned*nnp;
dVolume = zeros(ndof,1);
Volume=0; % total volume of the deformed body
max_nee = 81; % 81 since that's the most dof that are present in any element currently implemented
DVOL = zeros(max_nee,nel);

%% loop over all elements
parfor e = 1:nel
    
    % quad rule for each element type
    el_quad = quad_rules{ eltype(e) };
    
    % Get element info:
    nen_e = nen(eltype(e));
    nee = ned*nen_e;
    a = 1:nen_e;
    A = IEN(a,e);
    Xe = [x(A); y(A); z(A)];
    qe = [qi(ID(1,A)); qi(ID(2,A)); qi(ID(3,A))];
    
    if( eltype(e) == 12 )
        % 27-Node hexahedron
        [dVse, eVolume]= el12_compute_DVolume_mex(Xe, qe, int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
        
    elseif( eltype(e) == 13 )
        % 18-Node wedge
        [dVse, eVolume]= el13_compute_DVolume(Xe, qe, int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
        
    else
        error('Error: unknown element type\n');
    end
    
    % Use a direct reduction since the volume is a scalar
    Volume = Volume + eVolume;
    
    % save dVol for later reduction
    temp = zeros(max_nee,1);
    temp(1:nee) = dVse;
    DVOL(:, e) = temp;
    
end

%% assemble into global tuple
for e = 1:nel
    nee = ned*nen(eltype(e));
    i = LM(1:nee,e);
    dVolume(i) = dVolume(i) + DVOL(1:nee,e);
end

