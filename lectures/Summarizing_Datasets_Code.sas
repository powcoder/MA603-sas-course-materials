* Summarizing Datasets ;


libname data "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

* example of proc freq with one-way analysis of all variables ;
proc freq data=data.occupancy;
run;

* example of proc freq with one-way analysis of listed variables ;
* note VAR is not an option statement with Proc Freq ;
proc freq data=data.occupancy;
tables smokers residents ;
run;

* example of proc freq with two-way analysis ;
proc freq data=data.occupancy;
tables dogbreed * dogs ;
run;

* example of proc freq using additional options ;
proc freq data=data.occupancy;
tables dogbreed * dogs / list nopercent missing out=occupancy_freq;
run;

* example of proc freq using additional options ;
* the noprint option in the freq statement suppresses the Results window ;
proc freq noprint data=data.occupancy;
tables dogbreed * dogs / list nopercent missing out=occupancy_freq;
run;




* example of proc means ;
proc means	data=data.occupancy;
run;

* example of proc means with maxdec=2 and specific statistics ;
proc means	data=data.occupancy mean median mode range ;
run;

* sort by dogbreed ;
proc sort data=data.occupancy out=work.occupancy
	sortseq = linguistic ;
by dogbreed;
run;

* example of proc means with BY and VAR statements ;
proc means	data=work.occupancy maxdec=2 n min max sum;
by dogbreed;
var residents dogs;
run;

* example of proc means with CLASS and VAR statements ;
proc means	data=data.occupancy maxdec=2 n min max sum
;	output out=occupancy_stats;
class dogbreed;
var residents dogs;
run;

* The BY statement can also be used with Proc Print ;
proc print data=occupancy;
by dogbreed;
run;
