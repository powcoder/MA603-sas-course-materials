* Logical Statements ;



libname	mydata1 	"\\tsclient\David\Desktop\Teaching\MET MA 603\2016 Fall\03_Datasets\Datasets1";

* Example of IF-THEN statement with one condition;
data	work.occupancy;
set		mydata1.occupancy;
if DogBreed = "" then DogBreed = "NO DOGS";
run;



* Example of IF-THEN-ELSE statement with one condition;
* verify row 995;
data	work.occupancy;
set		mydata1.occupancy;
length House_Type $11;
if dogs > residents then
	House_Type = "More Dogs";
	else House_Type = "More People";
run;



* Example of IF-THEN-ELSE IF statement ;
data	work.occupancy;
set		mydata1.occupancy;
length House_Type $11;
if		dogs > residents	then House_Type = "More Dogs";
else if	dogs < residents	then House_Type = "More People";
else							 House_Type = "Same";
run;



* Parallel IF statement are evaluated in order, and are not necessarily mutually exclusive ;
* note incorrect value in observation 995 ;
data	work.occupancy;
set		mydata1.occupancy;
length House_Type $11;
if		dogs > residents	then House_Type = "More Dogs";
if		dogs < residents	then House_Type = "More People";
else							 House_Type = "Same";
run;



* example of AND and OR logical operators ;
data	work.occupancy;
set		mydata1.occupancy;
if residents = 1 and dogs = 0 then Lonely_Person = "Yes";
							  else Lonely_Person = "No";
run;


data	work.occupancy;
set		mydata1.occupancy;
length  Lonely_Person $3;
if residents > 1 or dogs > 0  then Lonely_Person = "No";
							  else Lonely_Person = "Yes";
run;



* example of IN logical operator ;
* how could the same result be accomplished with a function?;
data	occupancy;
set		mydata1.occupancy;
if dogbreed in ("NONE OF THE ABOVE", "None of the above") then BreedType = "Safe Breed";
run;



* example of NOT IN logical operator ;
* how could the same result be accomplished with a function?;
data	occupancy;
set		mydata1.occupancy;
if dogbreed not in ("NONE OF THE ABOVE", "None of the above", "") then BreedType = "Unsafe Breed";
run;



* example of DO-END statements ;
data	occupancy;
set		mydata1.occupancy;
length DogInd $2;
if dogs > 0 then DogInd = "1+";
			else do;
					DogInd = "0";
					DogBreed = "No Dogs";
				end;
run;
