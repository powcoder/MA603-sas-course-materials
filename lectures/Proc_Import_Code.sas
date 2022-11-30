* Proc Import ;



* SAS will only over-write an existing dataset when Replace is included ;
proc import
	datafile = "C:\Users\govonlu\Desktop\Data\scores1.txt"
		out = work.scores	dbms = tab	REPLACE
	;
run;


* since SAS will assume that a .txt file is tab-delimited, the DBMS argument can be left out ;
proc import
	datafile = "C:\Users\govonlu\Desktop\Data\scores1.txt"
		out = work.scores	REPLACE
	;
run;


* since the file extension is .txt, SAS assumes the data are separated with tabs ;
* use delimiter statement to indicate that data are separated with dashes ;
* by default, Proc Import assumes the first line contains the variable names ;
* use getnames=no to indicate that variable names are not included in the file ;
proc import
	datafile = "C:\Users\govonlu\Desktop\Data\scores2.txt"
		out = work.scores	REPLACE ;
	delimiter = "-";
	getnames = no;
run;


* since the file extension is .txt, SAS assumes the data are separated with tabs ;
* use delimiter statement and/or the DBMS argument to indicate that data are separated with commas ;
proc import
	datafile = "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\03_Datasets\Datasets1\scores9.txt"
		out = work.scores REPLACE ;
	delimiter = ",";
	getnames=no;
run;
proc import
	datafile = "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\03_Datasets\Datasets1\scores9.txt"
		out = work.scores	dbms=csv REPLACE ;
	getnames=no;
run;


* by default, Proc Import starts reading data from the first line of the file ;
* use the datarow statement to specify which line to start at ;
* by default, Proc Import determines the variable types and lengths based on the first 20 rows ;
* use the guessingrows statement to specify the number of rows ;
proc import
	datafile = "C:\Users\govonlu\Desktop\Data\occupancy.txt"
		out = work.occupancy	REPLACE ;
	getnames = no;
	datarow = 6;
	guessingrows = 3000;
run;


* proc import may fail when asked to import data organized into columns ;
proc import
	datafile = "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\03_Datasets\Datasets1\scores3.txt"
		out = work.scores	REPLACE ;
	delimiter = " ";
	getnames=no;
run;
proc import
	datafile = "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\03_Datasets\Datasets1\scores3.txt"
		out = work.scores dbms=dlm	REPLACE ;
	getnames=no;
run;


* proc import may fail when ased to import formatted data ;
proc import
	datafile = "P:\DavidG\Teaching\03_Datasets\2015_09_02\state_populations.txt"
		out = work.state_pops	REPLACE ;
run;
