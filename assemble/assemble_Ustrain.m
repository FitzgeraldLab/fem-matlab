function Ustrain = assemble_Ustrain(...
    IEN, ID, nen, nel, eltype, matype,...
    E, nu, x, y, z, qi, quad_rules)

%%
Ue = zeros(nel,1);

%% loop over all elements
parfor e = 1:nel
    
    nen_e = nen(eltype(e));
    
    % quad rule for each element type
    el_quad = quad_rules{ eltype(e) };
    
    % setup xe ye ze, faster
    a = 1:nen_e;
    A = IEN(a,e);
    Xe = [x(A); y(A); z(A)];
    qe = [qi(ID(1,A)); qi(ID(2,A)); qi(ID(3,A))] ;
    
    if eltype(e) == 11
        % 10-Node tetrahedon
        if matype(e) == 1
            % Kirchoff Material
            Ue(e) = el11_Ustrain_kirch(Xe, qe, E(e), nu(e), int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
        elseif matype(e) == 2
            % Biot Material
            Ue(e) = el11_Ustrain_biot(Xe, qe, E(e), nu(e), int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
        else
            error('Error: unknown material type: matype(%d) = %d\n',e,matype(e));
        end
        
    elseif eltype(e) == 12
        % 27-Node hexahedra
        if matype(e) == 1
            % Kirchoff Material
            Ue(e) = el12_Ustrain_kirch_mex(Xe, qe, E(e), nu(e), int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
        elseif matype(e) == 2
            % Biot Material
            Ue(e) = el12_Ustrain_biot_mex(Xe, qe, E(e), nu(e), int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
        else
            error('Error: unknown material type: matype(%d) = %d\n',e,matype(e));
        end
        
    elseif eltype(e) == 13
        % 18-Node wedge
        if matype(e) == 1
            % Kirchoff Material
            Ue(e) = el13_Ustrain_kirch(Xe, qe, E(e), nu(e), int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
        elseif matype(e) == 2
            % Biot Material
            Ue(e) = el13_Ustrain_biot(Xe, qe, E(e), nu(e), int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.zeta, el_quad.w);
        else
            error('Error: unknown material type: matype(%d) = %d\n',e,matype(e));
        end
        
    else
        error('Error: unknown element type: eltype(%d) = %d\n',e,eltype(e));
    end
    
end

%%
Ustrain = sum(Ue);
