* Importing with the Data Step - Part II ;


* Proc Import fails because there are multiple delimiter characters between some variables,
  and because State and Population aren't delimited ;
proc import datafile="C:\Users\govonlu\Desktop\Data\city_populations9.txt"
		out=city_pops9 replace;
	delimiter = " ";
	getnames = no;
run;


* List-Style method fails because State and Population aren't delimited ;
data	city_pops9;
infile	"C:\Users\govonlu\Desktop\Data\city_populations9.txt"
			truncover;
input	City $ State $ Population ;
run;


* Fixed-Width method fails because it doesn't recognize Population as a number, due to the commas ;
data	city_pops9;
infile	"C:\Users\govonlu\Desktop\Data\city_populations9.txt"
			truncover;
input	City $1-12 State $14-15 Population 17-24;
run;


* Informat-Style Input is the only way to correctly read the data ;
* Note similarities to Fixed-Width Input ;
data	city_pops9;
infile	"C:\Users\govonlu\Desktop\Data\city_populations9.txt"
			truncover;
input	City $13. State $2. Population comma9.;
run;


* Method fails when with City $12. since SAS starts reading from column 13, which is a space ;
data	city_pops9;
infile	"C:\Users\govonlu\Desktop\Data\city_populations9.txt"
			truncover;
input	City $12. State $2. Population comma9.;
run;


* the +1 moves the SAS cursor one place to over, so that it reads from the correct place ;
data	city_pops9;
infile	"C:\Users\govonlu\Desktop\Data\city_populations9.txt"
			truncover;
input	City $12. +1 State $2. Population comma9.;
run;


* the pointer moves the SAS cursor to column 14 ;
data	city_pops9;
infile	"C:\Users\govonlu\Desktop\Data\city_populations9.txt"
			truncover;
input	City $12. @14 State $2. Population comma9.;
run;



* mixing inputs ;
* City read using List-Style, State read using Fixed-Width, Population read using Informat ;
data	city_pops9;
infile	"C:\Users\govonlu\Desktop\Data\city_populations9.txt"
			truncover;
length	City $18 ;
input	City $ State $14-15 Population comma9.;
run;



* example of format statement ;
data	city_pops9;
infile	"C:\Users\govonlu\Desktop\Data\city_populations9.txt"
			truncover;
length	City $16 ;
format	City $Upcase18. Population comma9.0 ;
input	City $ State $14-15 Population comma9.;
run;


