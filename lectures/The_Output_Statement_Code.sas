* Output Statement;


* the output statement tells SAS to write the current observation to the output dataset ;

* when the output statement is left out of the datastep, SAS will by default output the
  current observation to the dataset at the end of each iteration ;
data	work.numbers;
set		mydata.integers;
run;

* when the output statement is included, this overrides the default behaviour, and SAS will only
  write observations to the dataset when explicitly instructed to ;
data	work.numbers;
set		mydata.integers;
output	work.numbers;
run;

* example where the name of the output dataset is left out ;
data	work.numbers;
set		mydata.integers;
output;
run;



* conditionally writing observations to the output dataset ;
data	odd_numbers;
set		mydata.integers;
if mod(Number, 2) = 1 then output odd_numbers;
run;

data	odd_numbers;
set		mydata.integers;
if mod(Number, 2) = 1 then output;
run;



* not specifying an action after an IF condition is a short-hand way of entering "then output" ;
* this is also know an sub-setting a dataset, or the Subset statement ;
data	odd_numbers;
set		mydata.integers;
if mod(Number, 2) = 1;
run;



* when more than one name appears in the Data statement, observations can be written to multiple datasets ;
data	numbers_a numbers_b;
set		mydata.integers;
run;



* writing observations to multiple output datasets based on IF condition ;
data	odd_numbers even_numbers;
set		mydata.integers;
if mod(Number, 2) = 1 then output odd_numbers;
					  else output even_numbers;
run;

* if dataset name is left out, observations will be written to all output datasets ;
data	odd_numbers even_numbers;
set		mydata.integers;
if mod(Number, 2) = 1 then output;
					  else output;
run;

data	odd_numbers even_numbers;
set		mydata.integers;
output;
run;

data	odd_numbers even_numbers;
set		mydata.integers;
output	odd_numbers even_numbers;
run;



* combine output with Do Loop to create a dataset with the integers from 1 to 100 ;
data	integers;
do Number = 1 to 100 ;
	output;
end;
run;
