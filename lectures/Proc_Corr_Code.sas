* Proc Corr ;



libname data3 "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

* by default SAS will calculate correlations between all combinations of variables ;
proc corr data=data3.golf_total ;
run;

* the VAR statement specifies which variables to include in the analysis ;
proc corr data=data3.golf_total ;
var hole1 hole2 hole3 total_score;
run;

* the With statement instructs SAS to calculate the correlation between a variable and each variable in the Var statement ;
* Total_Score is Moderately Correlated with Hole1, Weakly Correlated with Hole2, and Uncorrelated with Hole3 ;
proc corr data=data3.golf_total plots=matrix(histogram);
var hole1-hole3;
with total_score;
run;



data	work.numbers;
do i = 1 to 10;
	j = 5 * i + 2;
	k = i + 0.5 - rand("Uniform");
	m = -3 * i;
	n = rand("Uniform") * 25 - i;
	output;
end;
run;

* j is Pefectly Correlated with i ;
* k is Strongly Correlated with i ;
* m has Perfect Negative Correlation with i ;
* n has Strong Negative Correlation with i ;
proc corr data=work.numbers;
var j k m n;
with i;
run;



* can't use character data in correlation ;
proc corr data=data3.heights;
var sex;
with height;
run;

data	work.heights;
set		data3.heights;
if sex="F" then S=1;
			else S=2;
run;

* can use numeric indicator to calculate correlation ;
* note effect of using M = 0 instead of M = 2 ;
* height is Weakly Correlated with sex ;
proc corr data=work.heights;
var s;
with height;
run;
