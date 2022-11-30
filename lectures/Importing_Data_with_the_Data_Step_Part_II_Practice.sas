


* september daylight ;
* if more than one variable have the same format, the format only needs to be entered once ;
data	september_daylight ;
infile	"C:\Users\govonlu\Desktop\Data\september_daylight.txt"
		firstobs=2 truncover;
format	Date mmddyy10. Sunrise Sunset time5.;
input	Date mmddyy10.	+1 Sunrise time5. @21 Sunset time5.  @32 Hours_of_Daylight ;
run;



* aoi curve ;
data	aoi_curve;
infile	"C:\Users\govonlu\Desktop\Data\aoi_curve.txt"
		firstobs=2 truncover;
format	Coverage dollar18.0;
input	Coverage dollar11. @18 Factor ;
run;



* scores6 ;
* many possible solutions ;
data	scores6;
infile	"C:\Users\govonlu\Desktop\Data\scores6.txt"
		truncover firstobs=2;
length	FirstName $18 LastName $18 School $3 ;
format	Registered date9. ;
input	FirstName $ LastName $ School $23-25 +6 Registered mmddyy10. @47 Score ;
run;



* state populations ;
data	state_pops;
infile	"C:\Users\govonlu\Desktop\Data\state_populations.txt"
		dlm='09'x firstobs=2 truncover;
length	State $18 ;
format	Population comma10. Pop_Percent percent8.2 ;
input	State $ Population comma10.0 +1 Pop_Percent percent6. ;
run;
