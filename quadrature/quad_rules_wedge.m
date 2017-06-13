function [quad_rule] = quad_rules_wedge(opt) 

%%
if strcmpi(opt.method, 'Witherden') || strcmpi(opt.method, 'default')

    quad_rule = quad_WitherdenVincent2015_wedge(opt);
    
elseif strcmpi(opt.method,'prod')
    
    quad_rule = quad_GL_wedge(opt.points);
    
else
    error('Method <%s> unknown',opt.method);
end
