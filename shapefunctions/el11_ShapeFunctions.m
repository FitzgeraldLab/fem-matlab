function [NN,Nr,Ns,Nt] = el11_ShapeFunctions(r,s,t)

%% Compute shape functions for element 11: quadratic 10 node tetrahedron
% $ r \in [-1,1] $
% $ s \in [-1,1] $
% $ t \in [-1,1] $
% $ r + s + t \leq  0 $

NN = [(1/2).*(1+r+s+t).*(2+r+s+t),(1/2).*r.*(1+r),(1/2).*s.*(1+s),(1/2) ...
  .*t.*(1+t),(-1).*(1+r).*(1+r+s+t),(1+r).*(1+s),(-1).*(1+s).*(1+r+ ...
  s+t),(-1).*(1+t).*(1+r+s+t),(1+s).*(1+t),(1+r).*(1+t)];

Nr = [(3/2)+r+s+t,(1/2)+r,0,0,(-2)+(-2).*r+(-1).*s+(-1).*t,1+s,(-1)+( ...
  -1).*s,(-1)+(-1).*t,0,1+t];

Ns = [(3/2)+r+s+t,0,(1/2)+s,0,(-1)+(-1).*r,1+r,(-2)+(-1).*r+(-2).*s+( ...
  -1).*t,(-1)+(-1).*t,1+t,0];

Nt = [(3/2)+r+s+t,0,0,(1/2)+t,(-1)+(-1).*r,0,(-1)+(-1).*s,(-1).*r+(-1) ...
  .*s+(-2).*(1+t),1+s,1+r];
