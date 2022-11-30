
* solution 1 ;
data	gas_bills;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0009\01\gas_bills.txt"
			dlm=";" firstobs=2 truncover;
input	date mmddyy10. +1 temp 2. +1 billingDays gasbill dollar16.;
format	date date9. temp 8.1 gasbill dollar16.2;
run;

* solution 2 ;
data	gas_bills;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0009\01\gas_bills.txt"
			dlm=";" firstobs=2 truncover;
input	date mmddyy10. +1 temp 12-13 billingDays gasbill dollar16.;
format	date date9. temp 8.1 gasbill dollar16.2;
run;

* solution 3 ;
data	gas_bills;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0009\01\gas_bills.txt"
			dlm=";" firstobs=2 truncover;
input	date mmddyy10. +1 temp 12-13 billingDays 15-16 +1 gasbill dollar16.;
format	date date9. temp 8.1 gasbill dollar16.2;
run;

* solution 4 ;
data	gas_bills;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0009\01\gas_bills.txt"
			dlm=";" firstobs=2 truncover;
input	date mmddyy10. +1 temp 12-14 billingDays 2. +1 gasbill dollar16.;
format	date date9. temp 8.1 gasbill dollar16.2;
run;
