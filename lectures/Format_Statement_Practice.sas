


data	scores1 ;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\2016 Fall\03_Datasets\Datasets1\scores1.txt" dlm='09'x firstobs=2;
length	FirstName $18 LastName $18 School $3 ;
format	LastName $upcase18. Score 6.1 ;
input	FirstName $ LastName $ School $ Score ;
run;

* Lengths either start with either a dollar sign or a number, so they can not be confused variable names ;
* numeric and date formats start with letter, so they could be confused with variable names ;
