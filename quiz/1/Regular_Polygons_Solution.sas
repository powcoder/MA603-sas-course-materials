* Quiz 1 Solution ;


* delimited ;
data	polygons ;
length	Shape $12 ;
input	Shape & Sides Angles ;
cards;
Triangle  3 60
Square  4 90
Pentagon  5  108
Hexagon  6 120
Heptagon  7 128.571
Octagon  8 135
Nonagon  9 144
Decagon  10 140
Hendecagon  11 147.273
Dodecagon  12 150
;
run;


* fixed-width ;
data	polygonsd;
input	Shape $1-10 Sides 12-13 Angles 15-21;
cards;
Triangle   03 060.000
Square     04 090.000
Pentagon   05 108.000
Hexagon    06 120.000
Heptagon   07 128.571
Octagon    08 135.000
Nonagon    09 144.000
Decagon    10 140.000
Hendecagon 11 147.273
Dodecagon  12 150.000
;
run;


* print ;
proc print data=polygons;
run;
