* Macros II ;



options mprint symbolgen mlogic  ;


* Example 1: Macro Logical Statements ;

%macro generate_numbers (execute_code);

	%if &execute_code = Y %then %put Data step will be run ;

	%else %put Data step will not be run ;

%mend;

%generate_numbers(Y) ;
%generate_numbers(N) ;
%generate_numbers(y) ;

* note impact of MLOGIC ;


%macro generate_numbers (execute_code);

	%if &execute_code = Y or &execute_code = y %then %do;

		%put Data step will be run ;

		data numbers;
		do i = 1 to 10;
			output;
		end;
		run;

	%end;

	%else %put Data step will not be run ;

%mend;

%generate_numbers(Y) ;
%generate_numbers(N) ;
%generate_numbers(y) ;

* note impact of MLOGIC ;
* note syntax uses OR (no such thing as %OR) ;



* Example 2: Macro Logical Statements ;

%macro test_loops;
	%do i = 1 %to 10;
		data	dataset_&i;
			do y = 1 to &i;
				output;
			end;
		run;
	%end;
%mend;
%test_loops;

* note difference between macro logicals and data step logicals ;
* note creation of macro variable &i (is it global or local?) ;



* Example 3: Double Macro Variables ;

%let FirstName1 = Paul ;
%let LastName1 = White ;
%let Title1 = Mr ;

%let FirstName2 = Amy ;
%let LastName2 = Jones ;
%let Title2 = Dr ;

%put &title1.. &firstname1 &lastname1;
%put &title2.. &firstname2 &lastname2;

%let n = 1;

%put &firstname&n ;
%put &&firstname&n ;

%put &&title&n... &&firstname&n &&lastname&n;

%macro names(m);

	%put &&title&m... &&firstname&m &&lastname&m;

%mend;

%names(1);
%names(2);



* Example 4: Call Symput ;

data	work.ma (rename=(abbrv=state));
set		data3.state_info (keep=abbrv name);
if abbrv = "MA" ;
run;

data	_null_;
set		work.ma;
call	symput("mystate", state);
run;

%put &mystate ;

data	_null_;
set		data3.state_info;
call	symput("mystate", abbrv);
run;

%put &mystate ;

* note variable mystate is overwritten as SAS loops through each observation in the dataset ;

data	_null_;
set		data3.state_info;
call	symput(compress(cat("mystate", _N_)), abbrv);
call	symput("records", _N_);
run;

%put &mystate1 ;
%put &mystate10 ;

%let n = 10;
%put &&mystate&n;

%put &records ;

data	_null_;
set		data3.state_info;
call	symput(compress(cat("mystate", _N_)), abbrv);
call	symput(cat("mysubreg", _N_), subregion);
call	symput(cat("myregion", _N_), region);
run;

%put "&mystate38";
%put "&mysubreg38";
%put "&myregion38";

* note character data includes white space based on length of variable ;
* note that some variables may resolve to SAS key words ;

data	_null_;
set		data3.state_info;
call	symput(compress(cat("mystate", _N_)), trim(abbrv));
call	symput(cat("mysubreg", _N_), trim(subregion));
call	symput(cat("myregion", _N_), trim(region));
run;

%put "&mystate38";
%put "&mysubreg38";
%put "&myregion38";



* Example 5: Combining Macro Concepts ;

%macro print_states(region);

	data	_null_;
	set		data3.state_info;
	call	symput(cat("mystate", _N_),  trim(abbrv));
	call	symput(cat("mysubreg", _N_), trim(subregion));
	call	symput(cat("myregion", _N_), trim(region));
	call	symput("records", _N_);
	run;

	%put List of States in the &region Region;

	%do i = 1 %to &records;
	
		%if "&&myregion&i" = "&region" %then
	
		%put &&mystate&i is in the &&mysubreg&i Sub-Region;

	%end;

%mend;

options nosymbolgen nomprint nomlogic;
%print_states(West);
%print_states(Northeast);
%print_states(South);
%print_states(Midwest);
options symbolgen mprint mlogic;
