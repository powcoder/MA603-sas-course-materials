


libname mydata "\\tsclient\Teaching\MET MA 603\2016 Fall\03_Datasets\Datasets3";

data	policies_by_state;
merge	mydata.state_info
		mydata.policies_by_state (rename=(state=Abbrv));
by		abbrv;
run;

* note variable in BY statement must be in both datasets ;
* note multiple lengths warning ;
* note missing values for AK and HI;



proc sort data=mydata.roof_rating out=work.roof_rating;
by material;
run;

proc sort data=mydata.policy_info (rename=(rooftype=Material)) out=work.policy_roof_type;
by material;
run;

data	work.policy_roof_factors;
merge	work.policy_roof_type
		work.roof_rating;
by		material;
format  factor 8.2;
run;

proc sort data=work.policy_roof_factors;
by policynumber;
run;
