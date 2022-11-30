* Datasets and Data Types ;



* Miles and Kilometers are numeric data types ;
* Conversion_Rule is character data type ;
data	distance;
		Miles = 26.22;
		Kilometers = 1.61 * Miles;
		Conversion_Rule = "Miles = 1.61 * Kilometers";
run;



* this dataset has a valid name ;
data MyPassword_201x_10_11;
password = "coolprof123";
run;


* this dataset has an invalid name ;
Data	201x 10 11.MyPassword ;
Password = "CoolProf123";
RUN;

* note that values in a dataset ("coolprof123" and "CoolProf123") are case-sensitive, while variable names
  ("password" and "Password") and keywords ("data" and "Data", "run" and "RUN") are not case-sensitive ;
