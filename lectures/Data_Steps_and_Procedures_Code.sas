* Data Steps and Procedures ;


* example of a Data Step ;
data	distance;
		Miles = 26.22;
		Kilometers = 1.61 * Miles;
run;


* when no name is specifed, SAS automatically assigns the name ;
data;
		Miles = 26.22;
		Kilometers = 1.61 * Miles;
run;


* when _null_ is used, the Data Step does not create a dataset ;
data	_null_;
		Miles = 26.22;
		Kilometers = 1.61 * Miles;
run;



* example of a Procedure ;
proc print data = distance ;
run;


* proc print with the noobs argument ;
proc print data = distance noobs ;
run;



* WARNING - when the run statement is left out, SAS will not be able to exit the Data Step ;
data	distance;
		Miles = 26.22;
		Kilometers = 1.61 * Miles;


* SAS knows the first Data Step has ended when it encounters the keyword Data ;
data	distance;
		Miles = 26.22;
		Kilometers = 1.61 * Miles;
data	weight;
		Pounds = 100;
		Kilograms = 0.453592 * pounds;
run;


* SAS knows the Data Step has ended when it encounters the keyword Proc ;
data	distance;
		Miles = 26.22;
		Kilometers = 1.61 * Miles;
proc print data = distance ;
run;
