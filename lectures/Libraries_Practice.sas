

libname practice "C:\Users\govonlu\Desktop\MA603";


* this code creates a permanent dataset in the practice library, named temperature ;
Data	practice.temperature ;
		Celsius = 25 ;
		Fahrenheit = Celsius * 9 / 5 + 32 ;
		Kelvin = Celsius + 273.15 ;
		Rankine =  Fahrenheit + 459.67 ;
run ;

libname pratice clear;

* error message indicates the practice library doesn't exist;
Data	practice.temperature ;
		Celsius = 25 ;
		Fahrenheit = Celsius * 9 / 5 + 32 ;
		Kelvin = Celsius + 273.15 ;
		Rankine =  Fahrenheit + 459.67 ;
run ;



* "ERROR: practice_lib is not a valide SAS name" ;
libname practice_lib "C:\Users\govonlu\Desktop\MA603";
