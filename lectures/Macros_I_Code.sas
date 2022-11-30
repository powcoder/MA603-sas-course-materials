* Macros I ;



options symbolgen ;


* Example 1: Creating and Using Macro Variables ;

data	testing_macros;
x = 5;
z = 7;
y = x *2;
run;

* define macro variable with name of e and value of 2 ;
%let e = 2;

data	testing_macros;
x = 5;
z = 7;
y = x *&e;
run;

%let b  = x ;	* %let b  = z ;
%let op = * ;	* %let op = - ;	* %let op = ** ;


* macro variable b  ends when SAS encounters space ;
* macro variable op ends when SAS encounters ampersand ;
* macro variable e  ends when SAS encounters semicolon ;
* period could also be used to indicate end of macro variables ;
data	testing_macros;
x = 5;
z = 7;
y = &b &op&e;
run;

* %put will show what the macro variable resolves to in the log ;
%put &e;
%put &b;
%put &e;

* note difference when nosymbolgen is used ;
options nosymbolgen;
%put &e;
%put &b;
%put &e;



* Example 2: Simple Macro Program ;

* defining the macro ;
%macro a_data_step ;

	data	nums ;
	do i = 1 to 10 ;
		output ;
	end ;
	run;

%mend ;

* calling the macro ;
%a_data_step ;



* Example 3: Passing a Value to a Macro Program ;

%macro a_data_step(n) ;

	data	nums_&n ;
	do i = 1 to &n ;
		output ;
	end ;
	run;

%mend ;

%a_data_step(10) ;
%a_data_step(50) ;
%a_data_step(100) ;



* Example 4: Developing a Macro Program Step-by-Step ;

* first create code for one case without macros, and make sure it works ;

* a simple code to print state info for the West region ;
libname data3 "\\tsclient\Teaching\MET MA 603\2017 Fall\03_Datasets\Datasets3";
libname west "\\tsclient\Teaching\MET MA 603\2017 Fall\03_Datasets\West";

data	west.west_states_info;
set		data3.state_info;
if region = 'West';
run;

proc print data=west.west_states_info noobs;
title "Data for the West Region";
footnote "Region based on US Census groupings";
run;

* to change the region, we would need to make changes in eight places ;

options symbolgen ;

* use macro variables in places that should be dynamic ;
* debug if necessary ;
%let myregion = West;

libname &myregion "\\tsclient\Teaching\MET MA 603\2017 Fall\03_Datasets\&myregion";

data	&myregion..&myregion._states_info;
set		data3.state_info;
if region = "&myregion";
run;

proc print data=&myregion..&myregion._states_info noobs;
title "Data for the &myregion Region";
footnote "Region based on US Census groupings";
run;

* note use of period in dataset name ;
* note use of double-period in library reference ;
* note that double-quotes must be used ;


* macro program ;
%macro region_info;

	data	&myregion..&myregion._states_info;
	set		mydata.state_info;
	if region = "&myregion";
	run;

	proc print data=&myregion..&myregion._states_info noobs;
	title "Data for the &myregion Region";
	footnote "Region based on US Census groupings";
	run;

%mend;

%let myregion = South;
%region_info;

* passing values to the macro program ;
%macro region_info(myregion);

	libname &myregion "\\tsclient\Teaching\MET MA 603\2016 Fall\03_Datasets\&myregion";

	data	&myregion..&myregion._states_info;
	set		mydata.state_info;
	if region = "&myregion";
	run;

	proc print data=&myregion..&myregion._states_info noobs;
	title "Data for the &myregion Region";
	footnote "Region based on US Census groupings";
	run;

%mend;

%region_info(West);
%region_info(Midwest);
%region_info(South);
* code won't work for Northeast since it will try to assign a library with too long of a name ;


* Example 5: Global and Local Macro Variables ;

%let currency1 = dollar ;

%put &currency1 ;

%macro test1;

	%let currency2 = euro ;

	%put &currency1 ;
	%put &currency2 ;

%mend;
%test1 ;

%put &currency2 ;

* currency1 is global (defined in open code) ;
* currency2 is local (defined inside a macro) ;


* Example 6: Global and Local Macro Variables ;

%global currency3 ;

%macro test2;

	%let currency3 = pound ;

%mend;
%test2 ;

%put &currency3 ;

%macro test3;

	%global currency4;
	%let currency4 = yuan;

%mend;
%test3;

%put &currency4;

* macro variable defined inside a macro can be made global (use global statement inside or outside the macro) ;



* Example 7: Automatic macro variables ;

* note use of quotation marks around character variables ;
data	sas_info_&SysDate;
format Date mmddyy.;
Date = today();
DayOfWeek = "&SysDay";
SAS_Vers = &SysVer;
SAS_USer = "&SysUserId";
run;
