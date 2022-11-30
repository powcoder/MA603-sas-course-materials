


* scores 1 ;
data	scores1 ;
infile	"\\cambosnapp01\Actuarial\DavidG\Teaching\Fall 2016\Datasets1\scores1.txt" dlm='09'x firstobs=2;
length	FirstName $18 LastName $18 ;
input	FirstName $ LastName $ School $ Score ;
run;



* scores 2 ;
data	scores2 ;
infile	"\\cambosnapp01\Actuarial\DavidG\Teaching\Fall 2016\Datasets1\scores2.txt" dlm='-';
length	FirstName $18 LastName $18 ;
input	FirstName $ LastName $ School $ Score ;
run;



* scores 3 - List Method ;
data	scores3 ;
infile	"\\cambosnapp01\Actuarial\DavidG\Teaching\Fall 2016\Datasets1\scores3.txt";
length	FirstName $18 LastName $18 ;
input	FirstName $ LastName $ School $ Score ;
run;



* scores 3 - Fixed-Width Method ;
data	scores3 ;
infile	"\\cambosnapp01\Actuarial\DavidG\Teaching\Fall 2016\Datasets1\scores3.txt" truncover;
input	FirstName $1-10 LastName $11-22 School $23-25 Score 32-34;
run;



* scores 4 ;
data	scores4 ;
infile	"\\cambosnapp01\Actuarial\DavidG\Teaching\Fall 2016\Datasets1\scores4.txt" truncover;
input	FirstName $1-10 LastName $11-22 School $23-25 Score 32-34;
run;



* scores 5 ;
data	scores5 ;
infile	"\\cambosnapp01\Actuarial\DavidG\Teaching\Fall 2016\Datasets1\scores5.txt" truncover;
input	FirstName $1-10 LastName $11-22 School $23-25 Score 32-34 Grade $36-38;
run;
