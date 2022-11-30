


options nosymbolgen ;


* Problem 1 ;

%let macr1 = hello ;
%let macr2 = BU ;
%let macr1macr2 = Boston ;
%let ma = 10 ;
%let cr1 = computer ;
%let cr  = soup ;
%let macr   = 24 ;


%put macr1 ;
%put &macr1 ;
%put &macr1&macr2 ;
%put &macr1.macr2 ;
%put &macr1macr2 ;
%put &ma.cr1 ;
%put ma.&cr.1 ;
%put &macr.1 ;

/*macr1*/
/*hello*/
/*helloBU*/
/*hellomacr2*/
/*Boston*/
/*10cr1*/
/*ma.soup1*/
/*241*/



* Problem 2 ;

data dates;
do i = 0 to today();
	Date = i;
	Year = year(date);
	output;
end;
drop i;
format Date date9.;
run;

%macro days(holiday, number, month, day);
	data  Days (keep=year);
	set   work.dates;
	if weekday(date) = &number and month(date)=&month and day(date)=&day;
	run;

	proc print data=days;
	title "&holiday on Day &number";
	footnote1 "&holiday is on &month./&day.";
	footnote2 "Day 1 = Sunday, Day 2 = Monday, etc.";
	run;
%mend;
%days(Christmas, 1, 12, 25);
%days(New_Years_Eve, 7, 12, 31);
%days(Halloween, 6, 10, 31);
%days(Independance_Day, 3, 7, 4);



* Problem 3 ;

libname data2 "\\tsclient\Teaching\MET MA 603\2016 Fall\03_Datasets\Datasets2";

%macro loss_report(ind, period, metric);
	data	work.losses;
	set		data2.losses;
	weatherflagall=2;
	LossType=&ind;
	&period	= &period.(date);
	run;

	proc means data=losses &metric. maxdec=0;
	title "&metric of Losses by &period";
	footnote;
	class &period. losstype;
	var amount;
	where weatherflag = &ind or weatherflagall=&ind;
	run;
%mend;

%loss_report(0, Year, Sum);
%loss_report(1, Month, Max);
%loss_report(0, Qtr, Median);
%loss_report(0, Weekday, Sum);
%loss_report(2, Year, Sum);
