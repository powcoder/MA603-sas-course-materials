* Example 5: ODS - Trace and Select ;

ODS Trace on;

proc corr data=work.numbers;
var j k m n;
with i;
/*ods select corr.PearsonCorr;*/
run;

proc means data=work.numbers;
var i;
run;

proc freq data=work.numbers;
/*ods select freq.table1.onewayfreqs freq.table2.onewayfreqs;*/
run;

* ODS Trace will print output object names in the Log ;
* ODS Select will only ouput what is listed ;


* Example 6: ODS - Listing ;

ODS Listing;
proc corr data=work.numbers;
var j k m n;
with i;
run;
ODS Listing Close;

* Can get same result using Tools > Options > Preferences ;
* note ODS _all_ Close will supress all output ;

ODS Listing file="\\cambosnapp01\Actuarial\DavidG\Teaching\03_Datasets\Output\corr_results.txt";
proc corr data=work.numbers;
var j k m n;
with i;
run;
ODS Listing Close;

* can save results in text file ;


* Example 7: ODS - HTML ;

ODS HTML file="\\cambosnapp01\Actuarial\DavidG\Teaching\03_Datasets\Output\corr_results_analysis.html"
	style = analysis;
ODS	noproctitle;
proc corr data=work.numbers;
var j k m n;
with i;
run;
ODS HTML Close;

* default style is HTML blue ;
* use ODS ProcTitle to print title again ;


* Example 8: ODS - SAS Datasets ;

ODS HTML;
ODS Output	corr.simplestats	= work.number_stats
			corr.pearsoncorr	= work.numbers_corr
			corr.varinformation	= work.numbers_var;
proc corr data=work.numbers;
var j k m n;
with i;
run;
ODS _all_ Close;

* note multiple ODS can be used with same Procedure ;


* Example 9: Creating PDFs and RTFs ;

ODS PDF body = "\\cambosnapp01\Actuarial\DavidG\Teaching\03_Datasets\Output\Height_Corr.pdf";
ODS RTF body = "\\cambosnapp01\Actuarial\DavidG\Teaching\03_Datasets\Output\Height_Corr.rtf";

ods startpage = No;

proc print data=work.numbers;
ods noproctitle;
run;

proc corr data=work.numbers;
var j k m n;
with i;
ods noproctitle;
ods select corr.PearsonCorr;
run;

ODS PDF close;
ODS RTF close;

* "body=" has same effect as "file=" ;
* can include more than one Procedure ;
* can choose which Outputs to include ;
* by default, each Procedure starts on a new page ;
