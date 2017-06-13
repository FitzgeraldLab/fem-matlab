%% std_element_defs.m
% defines standard sizes and things for the gmsh numbering system

%% Define 
% Types = { ...
%     {  2,  1, 'LINES',      'nbLines'},      ... % 1
%     {  3,  2, 'TRIANGLES',  'nbTriangles'},  ...
%     {  4,  2, 'QUADS',      'nbQuads'},      ...
%     {  4,  3, 'TETS',       'nbTets'},       ...
%     {  8,  3, 'HEXAS',      'nbHexas'},      ... %5
%     {  6,  3, 'PRISMS',     'nbPrisms'},     ...
%     {  5,  3, 'PYRAMIDS',   'nbPyramids'},   ...
%     {  3,  1, 'LINES3',     'nbLines3'},     ...
%     {  6,  2, 'TRIANGLES6', 'nbTriangles6'}, ...
%     {  9,  2, 'QUADS9',     'nbQuads9'},     ... % 10
%     { 10,  3, 'TETS10',     'nbTets10'},     ...
%     { 27,  3, 'HEXAS27',    'nbHexas27'},    ...
%     { 18,  3, 'PRISMS18',   'nbPrisms18'},   ...
%     { 14,  3, 'PYRAMIDS14', 'nbPyramids14'}, ...
%     {  1,  0, 'POINTS',     'nbPoints'},     ... % 15
%     {  8,  3, 'QUADS8',     'nbQuads8'},     ...
%     { 20,  3, 'HEXAS20',    'nbHexas20'},    ...
%     { 15,  3, 'PRISMS15',   'nbPrisms15'},   ...
%     { 13,  3, 'PYRAMIDS13', 'nbPyramids13'}, ...
%     };

% define the number of nodes per element
% nen('element type number') = 'number of nodes per element'
nen = [ ...
    2, ...
    3, ...
    4, ...
    4, ...
    8, ...
    6, ...
    5, ...
    3, ...
    6, ...
    9, ...
    10, ...
    27, ...
    18, ...
    14, ...
    1, ...
    8, ...
    20, ...
    15, ...
    13] ;

% setup unchanging parameters:
% spatial dimensions:
ned = 3;

