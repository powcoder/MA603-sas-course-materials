* Format Statement ;


* note impact on variable order if format statement is before input statement ;
* what happens when format is comma8. ? ;
data city_populations;
input City $ State $ Population;
format State $Upcase2. Population comma12.;
datalines;
Boston ma   610000
Chicago il 2410000
Seattle wa  415000
;
run;



* practice with date formats ;
data	Dates ;
Date1 = 0 ;
Date2 = 366 ;
Date3 = 365 * 50 ;
Date4 = Date3 ;
Format Date1 date9. Date2 Date3 mmddyy10. Date4 yyqr6.;
run;



* format statement does not work with Proc Import ;
proc import
	datafile = "C:\Users\govonlu\Desktop\Data\occupancy.txt"
		out = work.occupancy	REPLACE ;
	getnames = no;
	datarow = 6;
	guessingrows = 3000;
	format var4 $upcase18.;
run;
