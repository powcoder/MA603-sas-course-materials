* Automatic Variables ;



* create a dataset with two variables;
* result is in ascending order of both number and number2;
data	integers ;
do number = 1 to 10 ;
number2 = number + mod(number,2) ;
output ;
end ;
run;

data	autos ;
set		integers ;
by number2 ;
first_num2 = first.number2 ;
last_num2 = last.number2 ;
n = _N_ ;
run;

* examples where _N_ is different than the row number ;
data	integers ;
do number = 1 to 10 ;
number2 = number + mod(number,2) ;
n = _N_ ;
output ;
end ;
run;


data	integers_1_2;
do i = 1 to 2 ;
output ;
end ;
run;

data	integers ;
set		integers_1_2;
do j = 1 to 5 ;
number = j * 2 ;
number2 = number + mod(number,2) ;
n = _N_ ;
output ;
end ;
run;



libname data2 "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\03_Datasets\Datasets2";


* find largest loss for each Year ;

data	losses;
set		data2.losses;
Year = year(date);
run;

proc sort data=losses;
by descending amount;
run;

* note values of the first and last variables;
data	maxloss;
set		work.losses;
by		descending amount;
first_amount = first.amount;
last_amount = last.amount;
run;

proc sort data=losses;
by year;
run;

* note values of the first and last variables;
data	maxyear;
set		work.losses;
by		year;
first_year = first.year;
last_year = last.year;
run;

proc sort data=losses;
by year descending amount;
run;

* note values of the first and last variables;
data	maxloss_by_year;
set		work.losses;
by		year descending amount;
first_year = first.year;
last_year = last.year;
first_amount = first.amount;
last_amount = last.amount;
run;

data	maxloss_by_year (drop=weatherflag);
format  date date9. amount dollar8.0;
set		work.losses;
by		year descending amount;
if		first.year;
run;


* create a dataset with only the first 50 observations ;

data	losses_numbered;
format LossNumber 8.0;
set		data2.losses;
LossNumber = _N_;
run;

data	first_50_losses;
set		data2.losses;
if _N_ <= 50;
/*if _N_ <= 50 then output first_50_losses;*/
run;
