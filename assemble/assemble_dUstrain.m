function [dUstrain] = assemble_dUstrain(...
    LM, IEN, ID, ned, nnp, nen, nel, eltype, matype,...
    YoungsModulus, nu, quad_rules, x, y, z, qi)

%%
ndof = ned*nnp;
dUstrain = zeros(ndof,1);

%% loop over all elements
for e = 1:nel
    
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
        % 27-Node hexahedra
        
        if( matype(e) == 1 )
            % Kirchoff Material
            dUse = el12_compute_DStrainEnergy_kirch_mex(Xe, qe, YoungsModulus(e), nu(e), int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
            %dUse = el12_compute_DStrainEnergy_kirch(Xe, qe, YoungsModulus(e), nu(e), el_quad.nt, el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
            
        elseif( matype(e) == 2 )
            % Biot Material
            dUse = el12_compute_DStrainEnergy_biot_mex(Xe, qe, YoungsModulus(e), nu(e), int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
            %dUse = el12_compute_DStrainEnergy_biot(Xe, qe, YoungsModulus(e), nu(e), el_quad.nt, el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
            
        else
            fprintf(2','Error: unknown material type\n');
            %break
        end
        
    elseif( eltype(e) == 13 )
        % 18-Node wedge
        
        if( matype(e) == 1 )
            % Kirchoff Material
            dUse = el13_compute_DStrainEnergy_kirch(Xe, qe, YoungsModulus(e), nu(e), el_quad.nt, el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
            
        elseif( matype(e) == 2 )
            % Biot Material
            dUse = el13_compute_DStrainEnergy_biot(Xe, qe, YoungsModulus(e), nu(e), el_quad.nt, el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
            
        else
            fprintf(2','Error: unknown material type\n');
            %break
        end
        
    else
        fprintf(2','Error: unknown element type\n');
        %break
    end
    
    %% assemble into global tuple
    nee = ned*nen(eltype(e));
    for loop1 = 1:nee
        i = LM(loop1,e);
        dUstrain(i) = dUstrain(i) + dUse(loop1);
    end
    
end


