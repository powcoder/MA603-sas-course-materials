* Exporting Data ;



data	numbers ;
do num = 1 to 25 ;
	num_cumul + num ;
	output ;
end ;
run;


* example of proc export ;
proc export	data=numbers
	outfile = "C:\Users\dgovonlu\Desktop\numbers.txt" replace;
	delimiter=" ";
	putname=No;
run;



* creating an external file with the Data Step ;
data	_null_;
file	"C:\Users\dgovonlu\Desktop\numbers2.txt";
if _N_ = 1
	then put "Number" @10 "Cumulative Number";
set		work.numbers;
put		num @10 num_cumul comma8.2;
run;



* creating an external file with the Data Step ;
data	_null_;
file	"C:\Users\dgovonlu\Desktop\accounts.txt";
set		data3.accounts;
LastName = propcase(LastName);
put		LastName @20 AcctNum +1 Amt dollar12.2;
run;

* how to right-justify AcctNum ? ;
data	_null_;
file	"C:\Users\dgovonlu\Desktop\accounts.txt";
set		data3.accounts;
s = length(acctnum) ;
LastName = propcase(LastName);
put		LastName @18 +(6-s) AcctNum +1 Amt dollar12.2;
run;
