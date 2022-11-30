


libname	mydata2 	"\\tsclient\David\Desktop\Teaching\MET MA 603\2016 Fall\03_Datasets\Datasets2";

data	reps;
set		mydata2.reps;
off_space = find(office, " ");
Office_Number = substr(office, 1, off_space - 1);
run;
