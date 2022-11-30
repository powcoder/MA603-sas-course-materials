* Proc Transpose */;



data test_data;
input A B C ;
cards;
1 2 3
4 5 6
7 8 9
;
run;

proc transpose data=test_data out=test_data_transposed;
run;



* switches variables and observations ;
proc transpose data=mydata.losses_by_year out=loss_by_year_t;
run;

* year stays as a variable ;
proc transpose data=mydata.losses_by_year out=loss_by_year_t;
by year;
run;

* only losses is transposed. WeatherFlag is not used at all ;
proc transpose data=mydata.losses_by_year out=loss_by_year_t;
by year;
var losses;
run;

* Weatherflag is used as the column title (SAS adds _ at the start of the name since names can't start with 0-9) ;
proc transpose data=mydata.losses_by_year out=loss_by_year_t;
by year;
var losses;
id weatherflag;
run;

* use rename and drop to clean up dataset ;
proc transpose data=mydata.losses_by_year out=loss_by_year_t (drop=_Name_ rename=(_0 = NW _1=WX));
by year;
var losses;
id weatherflag;
run;



data	work.losses_by_year;
set		mydata.losses_by_year;
if weatherflag=0	then Type = "NW";
					else Type = "WX";
run;

* note Type variable is not included ;
proc transpose data=work.losses_by_year out=loss_by_year_t;
by year;
run;

* note result if Type is included in VAR statement ;
proc transpose data=work.losses_by_year out=loss_by_year_t;
by year;
var losses type weatherflag;
run;

* multiple variables used in the ID statement will get combined ;
proc transpose data=work.losses_by_year out=loss_by_year_t;
by year;
id type weatherflag;
run;

proc transpose data=work.losses_by_year out=loss_by_year_t (drop=_name_);
by year;
id type weatherflag;
format NW0 WX1 comma16.;
run;
