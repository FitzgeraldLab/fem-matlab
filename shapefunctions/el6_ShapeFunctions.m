function [NN,Nr,Ns,Nt] = el6_ShapeFunctions(r,s,t)

%% Compute shape functions for element 6: linear 6 node wedge
% triangle part: $ r \in [-1,1] $, $ s \in [-1,1] $, $ r + s \leq 0 $
% $ t \in [-1,1]$

NN = [(1/4).*(r+s).*((-1)+t),(-1/4).*(1+r).*((-1)+t),(-1/4).*(1+s).*(( ...
  -1)+t),(-1/4).*(r+s).*(1+t),(1/4).*(1+r).*(1+t),(1/4).*(1+s).*(1+ ...
  t)];

Nr = [(1/4).*((-1)+t),(1/4).*(1+(-1).*t),0,(1/4).*((-1)+(-1).*t),(1/4) ...
  .*(1+t),0];

Ns = [(1/4).*((-1)+t),0,(1/4).*(1+(-1).*t),(1/4).*((-1)+(-1).*t),0,( ...
  1/4).*(1+t)];

Nt = [(1/4).*(r+s),(1/4).*((-1)+(-1).*r),(1/4).*((-1)+(-1).*s),(1/4).*( ...
  (-1).*r+(-1).*s),(1/4).*(1+r),(1/4).*(1+s)];
