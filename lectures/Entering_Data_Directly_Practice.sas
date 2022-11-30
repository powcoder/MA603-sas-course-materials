


data	sa_capitals_1 ;
length country $9 capital $12;
input  country capital & ;
datalines;
Argentina Buenos Aires
Bolivia Sucre
Brazil Brasilia
Chile Santiago
Colombia Bogotá
Ecuador Quito
Guyana Georgetown
Paraguay Asunción
Peru Lima
Suriname Paramaribo
Uruguay Montevideo
Venezuela Caracas
;
run;


data	sa_capitals_2 ;
input  country $1-9 capital $10-21;
datalines;
ArgentinaBuenos Aires
Bolivia  Sucre
Brazil   Brasilia
Chile    Santiago
Colombia Bogotá
Ecuador  Quito
Guyana   Georgetown
Paraguay Asunción
Peru     Lima
Suriname Paramaribo
Uruguay  Montevideo
VenezuelaCaracas
;
run;
