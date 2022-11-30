* Functions ;



libname	mydata1 	"\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\03_Datasets\Datasets1";
libname	mydata2 	"\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\03_Datasets\Datasets2";

* Example of Functions ;
data	work.occupancy;
set		mydata1.occupancy;
	Living_Entities			= Residents + Dogs;
	NonSmokers				= Residents - Smokers;
	DogBreed				= PROPCASE(dogbreed);
	Breed_Chars				= length(dogbreed);
	Most_Entities_of_a_type	= max(residents, dogs);
run;

* recall that we discovered an anomaly with the Dogbreed variable
  where None of the Above took on two different forms ;
proc freq data=mydata1.occupancy;
tables dogbreed;
run;
* using Propcase to change the value of Dogbreed eliminates the anomaly
  around None of the Above;
proc freq data=work.occupancy;
tables dogbreed;
run;




* Example of Functions ;
data scores;
set	mydata2.scores1;
len_first = length(FirstName);
Full_Name1 = cat(FirstName, " ", LastName);
Full_Name2 = cat(trim(FirstName), " ", trim(LastName));
Full_Name3 = cat(trim(LastName), ", ", trim(FirstName));
run;
* when concatenating variables, SAS inserts trailing blank spaces wherever the length
* of the observation is less than the length of the variable;
* the trim() function removes trailing blank spaces;
