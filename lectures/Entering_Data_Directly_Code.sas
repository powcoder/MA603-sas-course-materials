* Entering Data Directly ;



data city_populations;
input City $ State $ Population;
datalines;
Boston MA   610000
Chicago IL 2410000
Seattle WA  415000
;
run;


* the keyword Cards has the same effect as Datalines;
data city_populations;
input City $ State $ Population;
cards;
Boston MA   610000
Chicago IL 2410000
Seattle WA  415000
;
run;


* items longer than 8 characters will cause data to be truncated (cut off);
data city_populations;
input City $ State $ Population;
datalines;
Boston MA   610000
Chicago IL 2410000
Seattle WA  415000
Philadelphia PA 1567422
;
run;


* the length of City is modified from a default of 8 to 12 ;
* the length of State is set to 2 ;
* note that once the datatype is determined, it no longer needs to be specified ;
data city_populations;
length City $12 State $2 ;
input City State $ Population;
datalines;
Boston MA 610000
Chicago IL 2410000
Seattle WA 415000
Philadelphia PA 1567422
;
run;


* embedded spaces will cause the method to fail;
data city_populations;
length City $12 State $2 ;
input City State Population;
datalines;
Boston  MA 610000
Chicago  IL 2410000
Seattle  WA 415000
New York  NY 8550405
Philadelphia  PA 1567422
;
run;


* the ampersand (&) tells SAS that a single space doesn't indicate the end of the item;
* two or more spaces must be used to indicate the end of the data;
data city_populations;
length City $12 State $2 ;
input City & State Population;
datalines;
Boston  MA 610000
Chicago  IL 2410000
Seattle  WA 415000
New York  NY 8550405
Philadelphia  PA 1567422
;
run;


* datalines method with fixed-width data ;
* note the variable lenghts ;
data city_populations;
input City $1-12 State $14-15 Population 18-24;
datalines;
Boston       MA  0610000
Chicago      IL  2410000
Seattle      WA  0415000
New York     NY  8550405
Philadelphia PA  1567422
;
run;
