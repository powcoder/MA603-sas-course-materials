
libname in_data "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

* Individual ;
* use Pro sort to eliminate lowest score for each diver ;
proc sort data = in_data.diving out=diving;
by athlete score;
run;
proc sort data=diving out=lowest_scores nodupkey dupout=best4_scores;
by athlete;
run;
* use proc means to calculate the average of the best 4 dives ;
proc means data=best4_scores mean maxdec=2;
class athlete;
var score;
run;

* Country ;
proc sort data=in_data.diving out=diving;
by athlete descending score ;
run;
proc sort data=diving out=best_score_each_diver nodupkey;
by athlete;
run;
* use proc means to calculate the average of the 3 divers for each country ;
proc means data=best_score_each_diver mean maxdec=2;
class country;
var score;
run;
