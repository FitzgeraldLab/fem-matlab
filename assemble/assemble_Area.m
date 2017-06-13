function [Area] = assemble_Area(IEN, ID, nel, eltype,...
    quad_rules, x, y, z, qi, nen)

%% total volume of the deformed body
Area  = 0; 
eArea = nan(1,nel);

%% loop over all elements
%parfor e = 1:nel
for e = 1:nel
    
    % quad rule for each element type
    el_quad = quad_rules{ eltype(e) };
    
    % Get element info:
    nen_e = nen(eltype(e));
    a = 1:nen_e;
    A = IEN(a,e);
    Xe = [x(A); y(A); z(A)];
    qe = [qi(ID(1,A)); qi(ID(2,A)); qi(ID(3,A))] ;
    
    if( eltype(e) == 9 )        
        % 6-Node triangle
        eArea(e) = el9_compute_area(Xe, qe, int32(el_quad.nt), el_quad.xi, el_quad.eta, el_quad.w);
        
    else
        error('Error: unknown element type\n');
    end
        
end

Area = sum(eArea);
