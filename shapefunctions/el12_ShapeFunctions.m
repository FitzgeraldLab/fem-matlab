function [NN,Nr,Ns,Nt] = el12_ShapeFunctions(r,s,t)

%% Compute shape functions for element12: quad 27 node hexahedron

%%
NN = [(1/8).*((-1)+r).*r.*((-1)+s).*s.*((-1)+t).*t,(1/8).*r.*(1+r).*(( ...
  -1)+s).*s.*((-1)+t).*t,(1/8).*r.*(1+r).*s.*(1+s).*((-1)+t).*t,( ...
  1/8).*((-1)+r).*r.*s.*(1+s).*((-1)+t).*t,(1/8).*((-1)+r).*r.*((-1) ...
  +s).*s.*t.*(1+t),(1/8).*r.*(1+r).*((-1)+s).*s.*t.*(1+t),(1/8).*r.* ...
  (1+r).*s.*(1+s).*t.*(1+t),(1/8).*((-1)+r).*r.*s.*(1+s).*t.*(1+t),( ...
  -1/4).*((-1)+r.^2).*((-1)+s).*s.*((-1)+t).*t,(-1/4).*((-1)+r).*r.* ...
  ((-1)+s.^2).*((-1)+t).*t,(-1/4).*((-1)+r).*r.*((-1)+s).*s.*((-1)+ ...
  t.^2),(-1/4).*r.*(1+r).*((-1)+s.^2).*((-1)+t).*t,(-1/4).*r.*(1+r) ...
  .*((-1)+s).*s.*((-1)+t.^2),(-1/4).*((-1)+r.^2).*s.*(1+s).*((-1)+t) ...
  .*t,(-1/4).*r.*(1+r).*s.*(1+s).*((-1)+t.^2),(-1/4).*((-1)+r).*r.* ...
  s.*(1+s).*((-1)+t.^2),(-1/4).*((-1)+r.^2).*((-1)+s).*s.*t.*(1+t),( ...
  -1/4).*((-1)+r).*r.*((-1)+s.^2).*t.*(1+t),(-1/4).*r.*(1+r).*((-1)+ ...
  s.^2).*t.*(1+t),(-1/4).*((-1)+r.^2).*s.*(1+s).*t.*(1+t),(1/2).*(( ...
  -1)+r.^2).*((-1)+s.^2).*((-1)+t).*t,(1/2).*((-1)+r.^2).*((-1)+s).* ...
  s.*((-1)+t.^2),(1/2).*((-1)+r).*r.*((-1)+s.^2).*((-1)+t.^2),(1/2) ...
  .*r.*(1+r).*((-1)+s.^2).*((-1)+t.^2),(1/2).*((-1)+r.^2).*s.*(1+s) ...
  .*((-1)+t.^2),(1/2).*((-1)+r.^2).*((-1)+s.^2).*t.*(1+t),(-1).*(( ...
  -1)+r.^2).*((-1)+s.^2).*((-1)+t.^2)];

Nr = [(1/8).*((-1)+2.*r).*((-1)+s).*s.*((-1)+t).*t,(1/8).*(1+2.*r).*(( ...
  -1)+s).*s.*((-1)+t).*t,(1/8).*(1+2.*r).*s.*(1+s).*((-1)+t).*t,( ...
  1/8).*((-1)+2.*r).*s.*(1+s).*((-1)+t).*t,(1/8).*((-1)+2.*r).*((-1) ...
  +s).*s.*t.*(1+t),(1/8).*(1+2.*r).*((-1)+s).*s.*t.*(1+t),(1/8).*(1+ ...
  2.*r).*s.*(1+s).*t.*(1+t),(1/8).*((-1)+2.*r).*s.*(1+s).*t.*(1+t),( ...
  -1/2).*r.*((-1)+s).*s.*((-1)+t).*t,(1/4).*(1+(-2).*r).*((-1)+s).*( ...
  1+s).*((-1)+t).*t,(1/4).*(1+(-2).*r).*((-1)+s).*s.*((-1)+t).*(1+t) ...
  ,(-1/4).*(1+2.*r).*((-1)+s.^2).*((-1)+t).*t,(-1/4).*(1+2.*r).*(( ...
  -1)+s).*s.*((-1)+t.^2),(-1/2).*r.*s.*(1+s).*((-1)+t).*t,(-1/4).*( ...
  1+2.*r).*s.*(1+s).*((-1)+t.^2),(1/4).*(1+(-2).*r).*s.*(1+s).*((-1) ...
  +t).*(1+t),(-1/2).*r.*((-1)+s).*s.*t.*(1+t),(1/4).*(1+(-2).*r).*(( ...
  -1)+s).*(1+s).*t.*(1+t),(-1/4).*(1+2.*r).*((-1)+s.^2).*t.*(1+t),( ...
  -1/2).*r.*s.*(1+s).*t.*(1+t),r.*((-1)+s.^2).*((-1)+t).*t,r.*((-1)+ ...
  s).*s.*((-1)+t.^2),(1/2).*((-1)+2.*r).*((-1)+s.^2).*((-1)+t.^2),( ...
  1/2).*(1+2.*r).*((-1)+s.^2).*((-1)+t.^2),r.*s.*(1+s).*((-1)+t.^2), ...
  r.*((-1)+s.^2).*t.*(1+t),(-2).*r.*((-1)+s.^2).*((-1)+t.^2)];

Ns = [(1/8).*((-1)+r).*r.*((-1)+2.*s).*((-1)+t).*t,(1/8).*r.*(1+r).*(( ...
  -1)+2.*s).*((-1)+t).*t,(1/8).*r.*(1+r).*(1+2.*s).*((-1)+t).*t,( ...
  1/8).*((-1)+r).*r.*(1+2.*s).*((-1)+t).*t,(1/8).*((-1)+r).*r.*((-1) ...
  +2.*s).*t.*(1+t),(1/8).*r.*(1+r).*((-1)+2.*s).*t.*(1+t),(1/8).*r.* ...
  (1+r).*(1+2.*s).*t.*(1+t),(1/8).*((-1)+r).*r.*(1+2.*s).*t.*(1+t),( ...
  1/4).*((-1)+r).*(1+r).*(1+(-2).*s).*((-1)+t).*t,(-1/2).*((-1)+r).* ...
  r.*s.*((-1)+t).*t,(1/4).*((-1)+r).*r.*(1+(-2).*s).*((-1)+t).*(1+t) ...
  ,(-1/2).*r.*(1+r).*s.*((-1)+t).*t,(1/4).*r.*(1+r).*(1+(-2).*s).*(( ...
  -1)+t).*(1+t),(-1/4).*((-1)+r.^2).*(1+2.*s).*((-1)+t).*t,(-1/4).* ...
  r.*(1+r).*(1+2.*s).*((-1)+t.^2),(-1/4).*((-1)+r).*r.*(1+2.*s).*(( ...
  -1)+t.^2),(1/4).*((-1)+r).*(1+r).*(1+(-2).*s).*t.*(1+t),(-1/2).*(( ...
  -1)+r).*r.*s.*t.*(1+t),(-1/2).*r.*(1+r).*s.*t.*(1+t),(-1/4).*((-1) ...
  +r.^2).*(1+2.*s).*t.*(1+t),((-1)+r.^2).*s.*((-1)+t).*t,(1/2).*(( ...
  -1)+r.^2).*((-1)+2.*s).*((-1)+t.^2),((-1)+r).*r.*s.*((-1)+t.^2), ...
  r.*(1+r).*s.*((-1)+t.^2),(1/2).*((-1)+r.^2).*(1+2.*s).*((-1)+t.^2) ...
  ,((-1)+r.^2).*s.*t.*(1+t),(-2).*((-1)+r.^2).*s.*((-1)+t.^2)];

Nt = [(1/8).*((-1)+r).*r.*((-1)+s).*s.*((-1)+2.*t),(1/8).*r.*(1+r).*(( ...
  -1)+s).*s.*((-1)+2.*t),(1/8).*r.*(1+r).*s.*(1+s).*((-1)+2.*t),( ...
  1/8).*((-1)+r).*r.*s.*(1+s).*((-1)+2.*t),(1/8).*((-1)+r).*r.*((-1) ...
  +s).*s.*(1+2.*t),(1/8).*r.*(1+r).*((-1)+s).*s.*(1+2.*t),(1/8).*r.* ...
  (1+r).*s.*(1+s).*(1+2.*t),(1/8).*((-1)+r).*r.*s.*(1+s).*(1+2.*t),( ...
  1/4).*((-1)+r).*(1+r).*((-1)+s).*s.*(1+(-2).*t),(1/4).*((-1)+r).* ...
  r.*((-1)+s).*(1+s).*(1+(-2).*t),(-1/2).*((-1)+r).*r.*((-1)+s).*s.* ...
  t,(1/4).*r.*(1+r).*((-1)+s).*(1+s).*(1+(-2).*t),(-1/2).*r.*(1+r).* ...
  ((-1)+s).*s.*t,(1/4).*((-1)+r).*(1+r).*s.*(1+s).*(1+(-2).*t),( ...
  -1/2).*r.*(1+r).*s.*(1+s).*t,(-1/2).*((-1)+r).*r.*s.*(1+s).*t,( ...
  -1/4).*((-1)+r.^2).*((-1)+s).*s.*(1+2.*t),(-1/4).*((-1)+r).*r.*(( ...
  -1)+s.^2).*(1+2.*t),(-1/4).*r.*(1+r).*((-1)+s.^2).*(1+2.*t),(-1/4) ...
  .*((-1)+r.^2).*s.*(1+s).*(1+2.*t),(1/2).*((-1)+r.^2).*((-1)+s.^2) ...
  .*((-1)+2.*t),((-1)+r.^2).*((-1)+s).*s.*t,((-1)+r).*r.*((-1)+s.^2) ...
  .*t,r.*(1+r).*((-1)+s.^2).*t,((-1)+r.^2).*s.*(1+s).*t,(1/2).*((-1) ...
  +r.^2).*((-1)+s.^2).*(1+2.*t),(-2).*((-1)+r.^2).*((-1)+s.^2).*t]; 