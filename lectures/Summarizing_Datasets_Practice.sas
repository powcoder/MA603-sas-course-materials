


libname data "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";



proc freq data=data.golf ;
tables Hole1 * Hole72 / list nopercent;
run ;



proc means data=data.golf maxdec=2 mean min max stddev ;
var hole1-hole9 ;
run;


proc means data=data.scores1 mean stddev min max maxdec=0 ;
class school;
run;
