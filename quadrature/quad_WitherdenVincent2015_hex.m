function [quad_rule] = quad_WitherdenVincent2015_hex(opt) 

%%
% Based on http://dx.doi.org/10.1016/j.camwa.2015.03.017

%%
if opt.order == 1 
    quad_rule.method = 'Witherden';
    quad_rule.order  = 1;
    quad_rule.nt     = 1;
    quad_rule.domain = 'hex: [-1,1]';
    quad_rule.w = [ ...
         8.0000000000000000e+00]';
    quad_rule.xi = [ ...
         0.0000000000000000e+00]';
    quad_rule.eta = [ ...
         0.0000000000000000e+00]';
    quad_rule.zeta = [ ...
         0.0000000000000000e+00]';

elseif opt.order == 3 
    quad_rule.method = 'Witherden';
    quad_rule.order  = 3;
    quad_rule.nt     = 6;
    quad_rule.domain = 'hex: [-1,1]';
    quad_rule.w = [ ...
         1.3333333333333333e+00, ...
         1.3333333333333333e+00, ...
         1.3333333333333333e+00, ...
         1.3333333333333333e+00, ...
         1.3333333333333333e+00, ...
         1.3333333333333333e+00]';
    quad_rule.xi = [ ...
        -1.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         1.0000000000000000e+00, ...
         0.0000000000000000e+00]';
    quad_rule.eta = [ ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         1.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -1.0000000000000000e+00]';
    quad_rule.zeta = [ ...
         0.0000000000000000e+00, ...
         1.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -1.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00]';

elseif opt.order == 5 
    quad_rule.method = 'Witherden';
    quad_rule.order  = 5;
    quad_rule.nt     = 14;
    quad_rule.domain = 'hex: [-1,1]';
    quad_rule.w = [ ...
         8.8642659279778391e-01, ...
         8.8642659279778391e-01, ...
         8.8642659279778391e-01, ...
         8.8642659279778391e-01, ...
         8.8642659279778391e-01, ...
         8.8642659279778391e-01, ...
         3.3518005540166207e-01, ...
         3.3518005540166207e-01, ...
         3.3518005540166207e-01, ...
         3.3518005540166207e-01, ...
         3.3518005540166207e-01, ...
         3.3518005540166207e-01, ...
         3.3518005540166207e-01, ...
         3.3518005540166207e-01]';
    quad_rule.xi = [ ...
        -7.9582242575422146e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         7.9582242575422146e-01, ...
         0.0000000000000000e+00, ...
         7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
         7.5878691063932813e-01]';
    quad_rule.eta = [ ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         7.9582242575422146e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -7.9582242575422146e-01, ...
        -7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
        -7.5878691063932813e-01]';
    quad_rule.zeta = [ ...
         0.0000000000000000e+00, ...
         7.9582242575422146e-01, ...
         0.0000000000000000e+00, ...
        -7.9582242575422146e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
        -7.5878691063932813e-01, ...
         7.5878691063932813e-01, ...
         7.5878691063932813e-01]';

elseif opt.order == 7 
    quad_rule.method = 'Witherden';
    quad_rule.order  = 7;
    quad_rule.nt     = 34;
    quad_rule.domain = 'hex: [-1,1]';
    quad_rule.w = [ ...
         2.0012989098356701e-01, ...
         2.0012989098356701e-01, ...
         2.0012989098356701e-01, ...
         2.0012989098356701e-01, ...
         2.0012989098356701e-01, ...
         2.0012989098356701e-01, ...
         4.5715385606985276e-01, ...
         4.5715385606985276e-01, ...
         4.5715385606985276e-01, ...
         4.5715385606985276e-01, ...
         4.5715385606985276e-01, ...
         4.5715385606985276e-01, ...
         4.5715385606985276e-01, ...
         4.5715385606985276e-01, ...
         1.5379614006595868e-01, ...
         1.5379614006595868e-01, ...
         1.5379614006595868e-01, ...
         1.5379614006595868e-01, ...
         1.5379614006595868e-01, ...
         1.5379614006595868e-01, ...
         1.5379614006595868e-01, ...
         1.5379614006595868e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01, ...
         1.5930172375100887e-01]';
    quad_rule.xi = [ ...
        -9.8808616118867654e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         9.8808616118867654e-01, ...
         0.0000000000000000e+00, ...
         4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
         7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
        -8.4805227568403874e-01, ...
         8.4805227568403874e-01, ...
         0.0000000000000000e+00, ...
         8.4805227568403874e-01, ...
         8.4805227568403874e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -8.4805227568403874e-01, ...
        -8.4805227568403874e-01, ...
         8.4805227568403874e-01, ...
         0.0000000000000000e+00, ...
        -8.4805227568403874e-01]';
    quad_rule.eta = [ ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         9.8808616118867654e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -9.8808616118867654e-01, ...
        -4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
        -7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
        -8.4805227568403874e-01, ...
         0.0000000000000000e+00, ...
         8.4805227568403874e-01, ...
         8.4805227568403874e-01, ...
         0.0000000000000000e+00, ...
        -8.4805227568403874e-01, ...
        -8.4805227568403874e-01, ...
         0.0000000000000000e+00, ...
         8.4805227568403874e-01, ...
        -8.4805227568403874e-01, ...
         8.4805227568403874e-01, ...
         0.0000000000000000e+00]';
    quad_rule.zeta = [ ...
         0.0000000000000000e+00, ...
         9.8808616118867654e-01, ...
         0.0000000000000000e+00, ...
        -9.8808616118867654e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
        -4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
         4.0795516735831938e-01, ...
        -7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
        -7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
         7.8110282100411854e-01, ...
         0.0000000000000000e+00, ...
        -8.4805227568403874e-01, ...
        -8.4805227568403874e-01, ...
         0.0000000000000000e+00, ...
         8.4805227568403874e-01, ...
         8.4805227568403874e-01, ...
        -8.4805227568403874e-01, ...
         8.4805227568403874e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         8.4805227568403874e-01, ...
        -8.4805227568403874e-01]';

elseif opt.order == 9 
    quad_rule.method = 'Witherden';
    quad_rule.order  = 9;
    quad_rule.nt     = 58;
    quad_rule.domain = 'hex: [-1,1]';
    quad_rule.w = [ ...
         4.3327499574965456e-01, ...
         4.3327499574965456e-01, ...
         4.3327499574965456e-01, ...
         4.3327499574965456e-01, ...
         4.3327499574965456e-01, ...
         4.3327499574965456e-01, ...
         5.0148795299349028e-02, ...
         5.0148795299349028e-02, ...
         5.0148795299349028e-02, ...
         5.0148795299349028e-02, ...
         5.0148795299349028e-02, ...
         5.0148795299349028e-02, ...
         5.0148795299349028e-02, ...
         5.0148795299349028e-02, ...
         1.9885983814402350e-01, ...
         1.9885983814402350e-01, ...
         1.9885983814402350e-01, ...
         1.9885983814402350e-01, ...
         1.9885983814402350e-01, ...
         1.9885983814402350e-01, ...
         1.9885983814402350e-01, ...
         1.9885983814402350e-01, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.1789806136177640e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02, ...
         9.6116803513373372e-02]';
    quad_rule.xi = [ ...
        -6.1368146959170899e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         6.1368146959170899e-01, ...
         0.0000000000000000e+00, ...
         8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
         5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
        -8.7768712325767828e-01, ...
         8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
         8.7768712325767828e-01, ...
         8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -8.7768712325767828e-01, ...
        -8.7768712325767828e-01, ...
         8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
        -8.7768712325767828e-01, ...
         4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
        -9.3853042186467173e-01, ...
        -4.3226790263086218e-01, ...
         9.3853042186467173e-01, ...
         4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
        -9.3853042186467173e-01, ...
        -4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         9.3853042186467173e-01, ...
         4.3226790263086218e-01, ...
         9.3853042186467173e-01, ...
         9.3853042186467173e-01, ...
        -9.3853042186467173e-01, ...
         4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
        -9.3853042186467173e-01]';
    quad_rule.eta = [ ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         6.1368146959170899e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -6.1368146959170899e-01, ...
        -8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
        -5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
        -8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
         8.7768712325767828e-01, ...
         8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
        -8.7768712325767828e-01, ...
        -8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
         8.7768712325767828e-01, ...
        -8.7768712325767828e-01, ...
         8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
         9.3853042186467173e-01, ...
        -9.3853042186467173e-01, ...
         9.3853042186467173e-01, ...
        -4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
        -9.3853042186467173e-01, ...
        -9.3853042186467173e-01, ...
        -9.3853042186467173e-01, ...
         4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
         9.3853042186467173e-01, ...
         4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         9.3853042186467173e-01, ...
        -4.3226790263086218e-01, ...
        -4.3226790263086218e-01]';
    quad_rule.zeta = [ ...
         0.0000000000000000e+00, ...
         6.1368146959170899e-01, ...
         0.0000000000000000e+00, ...
        -6.1368146959170899e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
        -8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
         8.7009978466197591e-01, ...
        -5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
        -5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
         5.6411080702003003e-01, ...
         0.0000000000000000e+00, ...
        -8.7768712325767828e-01, ...
        -8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
         8.7768712325767828e-01, ...
         8.7768712325767828e-01, ...
        -8.7768712325767828e-01, ...
         8.7768712325767828e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         8.7768712325767828e-01, ...
        -8.7768712325767828e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         9.3853042186467173e-01, ...
        -4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
        -4.3226790263086218e-01, ...
        -9.3853042186467173e-01, ...
        -4.3226790263086218e-01, ...
        -9.3853042186467173e-01, ...
         9.3853042186467173e-01, ...
        -9.3853042186467173e-01, ...
         9.3853042186467173e-01, ...
        -4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         4.3226790263086218e-01, ...
         9.3853042186467173e-01, ...
         4.3226790263086218e-01, ...
        -9.3853042186467173e-01, ...
        -4.3226790263086218e-01]';

elseif opt.order == 11 
    quad_rule.method = 'Witherden';
    quad_rule.order  = 11;
    quad_rule.nt     = 90;
    quad_rule.domain = 'hex: [-1,1]';
    quad_rule.w = [ ...
         2.0247707361280018e-01, ...
         2.0247707361280018e-01, ...
         2.0247707361280018e-01, ...
         2.0247707361280018e-01, ...
         2.0247707361280018e-01, ...
         2.0247707361280018e-01, ...
         1.1753834795645628e-01, ...
         1.1753834795645628e-01, ...
         1.1753834795645628e-01, ...
         1.1753834795645628e-01, ...
         1.1753834795645628e-01, ...
         1.1753834795645628e-01, ...
         1.1753834795645628e-01, ...
         1.1753834795645628e-01, ...
         4.4643912078829243e-02, ...
         4.4643912078829243e-02, ...
         4.4643912078829243e-02, ...
         4.4643912078829243e-02, ...
         4.4643912078829243e-02, ...
         4.4643912078829243e-02, ...
         4.4643912078829243e-02, ...
         4.4643912078829243e-02, ...
         2.1599204525496912e-01, ...
         2.1599204525496912e-01, ...
         2.1599204525496912e-01, ...
         2.1599204525496912e-01, ...
         2.1599204525496912e-01, ...
         2.1599204525496912e-01, ...
         2.1599204525496912e-01, ...
         2.1599204525496912e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         1.4519934586011571e-01, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         6.1441994097835337e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02, ...
         2.2614296138821884e-02]';
    quad_rule.xi = [ ...
        -8.1261433409962647e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         8.1261433409962647e-01, ...
         0.0000000000000000e+00, ...
         6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
         8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
         3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
        -7.3466828699700804e-01, ...
         7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
         7.3466828699700804e-01, ...
         7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -7.3466828699700804e-01, ...
        -7.3466828699700804e-01, ...
         7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
        -7.3466828699700804e-01, ...
         4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
        -9.6509966551271031e-01, ...
        -4.5079993511450944e-01, ...
         9.6509966551271031e-01, ...
         4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
        -9.6509966551271031e-01, ...
        -4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         9.6509966551271031e-01, ...
         4.5079993511450944e-01, ...
         9.6509966551271031e-01, ...
         9.6509966551271031e-01, ...
        -9.6509966551271031e-01, ...
         4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
        -9.6509966551271031e-01, ...
         9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
        -3.5390281459663014e-01, ...
        -9.4124485721060325e-01, ...
         3.5390281459663014e-01, ...
         9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
        -3.5390281459663014e-01, ...
        -9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         3.5390281459663014e-01, ...
         9.4124485721060325e-01, ...
         3.5390281459663014e-01, ...
         3.5390281459663014e-01, ...
        -3.5390281459663014e-01, ...
         9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
        -3.5390281459663014e-01]';
    quad_rule.eta = [ ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         8.1261433409962647e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -8.1261433409962647e-01, ...
        -6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
        -8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
        -3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
        -7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
         7.3466828699700804e-01, ...
         7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
        -7.3466828699700804e-01, ...
        -7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
         7.3466828699700804e-01, ...
        -7.3466828699700804e-01, ...
         7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
         9.6509966551271031e-01, ...
        -9.6509966551271031e-01, ...
         9.6509966551271031e-01, ...
        -4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
        -9.6509966551271031e-01, ...
        -9.6509966551271031e-01, ...
        -9.6509966551271031e-01, ...
         4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         9.6509966551271031e-01, ...
         4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         9.6509966551271031e-01, ...
        -4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         3.5390281459663014e-01, ...
        -3.5390281459663014e-01, ...
         3.5390281459663014e-01, ...
        -9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
        -3.5390281459663014e-01, ...
        -3.5390281459663014e-01, ...
        -3.5390281459663014e-01, ...
         9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
         3.5390281459663014e-01, ...
         9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         3.5390281459663014e-01, ...
        -9.4124485721060325e-01, ...
        -9.4124485721060325e-01]';
    quad_rule.zeta = [ ...
         0.0000000000000000e+00, ...
         8.1261433409962647e-01, ...
         0.0000000000000000e+00, ...
        -8.1261433409962647e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
        -6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
        -6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
         6.0167526419826267e-01, ...
        -8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
        -8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
         8.5545576101776000e-01, ...
        -3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
        -3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
         3.1339340451605474e-01, ...
         0.0000000000000000e+00, ...
        -7.3466828699700804e-01, ...
        -7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
         7.3466828699700804e-01, ...
         7.3466828699700804e-01, ...
        -7.3466828699700804e-01, ...
         7.3466828699700804e-01, ...
         0.0000000000000000e+00, ...
         0.0000000000000000e+00, ...
         7.3466828699700804e-01, ...
        -7.3466828699700804e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         9.6509966551271031e-01, ...
        -4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
        -4.5079993511450944e-01, ...
        -9.6509966551271031e-01, ...
        -4.5079993511450944e-01, ...
        -9.6509966551271031e-01, ...
         9.6509966551271031e-01, ...
        -9.6509966551271031e-01, ...
         9.6509966551271031e-01, ...
        -4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         4.5079993511450944e-01, ...
         9.6509966551271031e-01, ...
         4.5079993511450944e-01, ...
        -9.6509966551271031e-01, ...
        -4.5079993511450944e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         3.5390281459663014e-01, ...
        -9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
        -9.4124485721060325e-01, ...
        -3.5390281459663014e-01, ...
        -9.4124485721060325e-01, ...
        -3.5390281459663014e-01, ...
         3.5390281459663014e-01, ...
        -3.5390281459663014e-01, ...
         3.5390281459663014e-01, ...
        -9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         9.4124485721060325e-01, ...
         3.5390281459663014e-01, ...
         9.4124485721060325e-01, ...
        -3.5390281459663014e-01, ...
        -9.4124485721060325e-01]';

else
    error('Method <%s> unknown',opt.method);
end
