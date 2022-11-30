


proc import datafile="\\cambosnapp01\Actuarial\DavidG\Teaching\Fall 2016\Datasets1\occupancy.csv"
	out = occupancy replace;
	guessingrows = 3000;
run;



proc import datafile="\\cambosnapp01\Actuarial\DavidG\Teaching\03_Datasets\2015_09_09\days_of_week1.txt"
	out = days replace;
	delimiter = "#";
run;



proc import datafile="\\cambosnapp01\Actuarial\DavidG\Teaching\03_Datasets\2015_09_09\days_of_week2.txt"
	out = days replace;
	delimiter = " ";
	datarow = 6;
	guessingrows = 8;
run;
