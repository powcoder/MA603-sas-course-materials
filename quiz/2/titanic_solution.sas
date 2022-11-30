

* Proc Import is the easiest method for this dataset ;
proc import datafile="\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0007\01\titanic.txt" 
			out=titanic;
delimiter="|";
run;
