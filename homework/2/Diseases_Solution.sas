

Proc import datafile="\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0004\01\Diseases.txt" 
				out=Diseases_ProcImport; delimiter='|';
run;

* alternative using ASCII code for the pipe character ;
Proc import datafile="\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0004\01\Diseases.txt" 
				out=Diseases_ProcImport; delimiter='7C'x;
run;


data	Diseases_DataStep;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0004\01\Diseases.txt"
		delimiter='|' firstobs=2;
length	Rank 3 Disease $24 ;
input	Rank Disease Deaths ;
run ;
