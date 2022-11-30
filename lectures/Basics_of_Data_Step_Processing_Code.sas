* Data Step Processing ;


* an empty dataset named cities is created ;
data	cities;
run;


* two variables are created. since no values were assigned the value of the observations are missing ;
data	cities;
format	City $12. Population 8.;
run;


* a value is provided for the City variable.
  Pop_100s is added to the dataset, but since there is no value for Population, Pop_1000s also has no value.
  the variables are added to the dataset in the order by which they appear. City appears before Pops_1000s
  (in the format statement) ;
data	cities;
format City $12. Population 8.;
Pop_1000s = Population / 1000;
City = "Boston";
run;


* when the quotation marks are left out, SAS thinks Boston is another variable for which there is no value assigned.
  when the variable Pops_1000s is created, the value for Population is missing ;
data	cities;
format City $12. Population 8.;
Pop_1000s = Population / 1000;
Population = 650000;
City = Boston;
run;


* example with no missing values ;
data	cities;
format City $12. Population 8.;
Population = 650000;
Pop_1000s = Population / 1000;
City = "Boston";
run;



* Example of Set Statement ;
data	city_pops1;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets\city_populations1.txt" ;
input	City $ State $ Population ;
run;
data	city_pops1_with_country;
set		city_pops1;
Country = "United States";
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
run;


* note difference when format statement comes before Set statement ;
data	city_pops1_with_country;
format	Population_000s comma10.0 Population comma12. ;
set		city_pops1;
Country = "United States";
Population_000s = Population / 1000 ;
run;


* populations_000s is being defined before the value of population is defined ;
data	city_pops1_with_country;
Country = "United States";
Population_000s = Population / 1000 ;
set		city_pops1;
format	Population_000s comma10.0 Population comma12. ;
run;



* example of drop ;
data	city_pops1_with_country (drop = population);
set		city_pops1;
Country = "United States";
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
run;


* drop can't be used with the input dataset, since one of the statements depends on it;
data	city_pops1_with_country;
set		city_pops1 (drop = population);
Country = "United States";
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
run;


* using the dataset option as a statement is equivalent to including it after the name of the output dataset;
data	city_pops1_with_country;
set		city_pops1;
Country = "United States";
drop population;
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
run;


* example of keep ;
data	city_pops1_with_country (keep=city state country population_000s);
set		city_pops1;
Country = "United States";
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
run;


* example of where ;
data	city_pops1_with_country (where=(population_000s > 500));
set		city_pops1;
Country = "United States";
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
run;

* remember that when used as a statement, Where applies to the input dataset;
data	city_pops1_with_country;
set		city_pops1;
Country = "United States";
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
where (population > 500000);
run;


* example of rename ;
data	city_pops1_with_country (rename=(Population=Pop state=State_Abbrv));
set		city_pops1;
Country = "United States";
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
run;


* when rename is used with the input dataset, subsequent statements must use the new name ;
data	city_pops1_with_country;
set		city_pops1 (rename=(Population=Pop state=State_Abbrv));
Country = "United States";
Population_000s = Population / 1000 ;
format	Population_000s comma10.0 Population comma12. ;
run;


data	city_pops1_with_country;
set		city_pops1 (rename=(Population=Pop state=State_Abbrv));
Country = "United States";
Population_000s = Pop / 1000 ;
format	Population_000s comma10.0 Pop comma12. ;
run;


* rename with Proc Import ;
proc import
	datafile = "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets\scores2.txt"
		out = work.scores (rename=(var1=FirstName var2=LastName var3=School var4=Score))
		REPLACE ;
	delimiter = "-";
	getnames = no;
run;
