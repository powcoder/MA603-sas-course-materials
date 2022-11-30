

* original code ;
Datas	temperature ;
		Fahrenheit = Celsius * 9 / 5 + 32 ;
		Celsius = 25 
		Kelvin = Celsius + 273.15 ;
		Rankine =  Farhenheit + 459.67 ;
Print	data = temperatures ; noobs ;


* de-bugged code ;
* change Datas to Data, switch the second and third statements, add a semicolon,
  fix mis-spelling of Fahrenheit, add Proc in front of Print,
  change temperatures to temperature (or vice-versa),
  noobs with the Proc statement,add run statement ;
Data	temperature ;
		Celsius = 25 ;
		Fahrenheit = Celsius * 9 / 5 + 32 ;
		Kelvin = Celsius + 273.15 ;
		Rankine =  Fahrenheit + 459.67 ;
Proc  Print	data = temperature noobs ;
run;


* The temperature dataset has 1 observation and 4 variables ;
