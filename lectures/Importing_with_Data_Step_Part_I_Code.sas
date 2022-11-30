* Importing with the Data Step - Part I ;



* List-Style input - simple example ;
* note default length of variables is set to 8 ;
data	city_pops1;
infile	"C:\Users\govonlu\Desktop\Data\city_populations1.txt" ;
input	City $ State $ Population ;
run;



* use delimiter= or dlm= to specify the delimiter ;
data	city_pops7;
infile	"C:\Users\govonlu\Desktop\Data\city_populations7.txt" 
			delimiter="-";
input	City $ State $ Population ;
run;



* Fixed-Width input - simple example ;
* lengths for character variables are based on range of columns ;
data	city_pops4;
infile	"C:\Users\govonlu\Desktop\Data\city_populations4.txt";
input	City $1-12 State $14-15 Population 17-23;
run;


* note that if the List-Stye method is use it will fail due to embedded spaces ;
data	city_pops4;
infile	"C:\Users\govonlu\Desktop\Data\city_populations4.txt";
input	City $ State $ Population ;
run;



* The Length statement is used to specify the size of the variables ;
* The Length statement does not impact how the data is read from the file ;
data	city_pops8;
infile	"C:\Users\govonlu\Desktop\Data\city_populations8.txt" 
		dlm='09'x;
length	City $16 State $2 ;
input	City $ State $ Population ;
run;



* firstobs= specifies which line to begin reading from ;
* obs=specifies the last row to read from ;
data	city_pops5;
infile	"C:\Users\govonlu\Desktop\Data\city_populations5.txt" firstobs=7 obs=9;
input	City $ State $ Population ;
run;



* population does not always go to column 23. this prevents the data from being read in correctly ;
data	city_pops3;
infile	"C:\Users\govonlu\Desktop\Data\city_populations3.txt" firstobs=2;
input	City $1-12 State $14-15 Population 17-23;
run;


* truncover instructs SAS to stop reading at the end of the line. anything that doesn't reach the end will be written to the dataset ;
data	city_pops3;
infile	"C:\Users\govonlu\Desktop\Data\city_populations3.txt" firstobs=2 truncover;
input	City $1-12 State $14-15 Population 17-23;
run;


* missover instructs SAS to stop reading at the end of the line. anything that doesn't reach the end will be dropped from to the dataset ;
data	city_pops3;
infile	"C:\Users\govonlu\Desktop\Data\city_populations3.txt" firstobs=2 missover;
input	City $1-12 State $14-15 Population 17-23;
run;


* example of missover ;
data	city_pops6;
infile	"C:\Users\govonlu\Desktop\Data\city_populations6.txt" firstobs=2 missover;
input	City $1-12 State $14-15 Population 17-23 Capital $31-33;
run;
