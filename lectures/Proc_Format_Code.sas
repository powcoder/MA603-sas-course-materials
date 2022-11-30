* Example 4: Proc Format ;

proc format;

value $breed	"None of the above" = "NONE OF THE ABOVE "
				" " = "NONE";

value nums		0 = " -"
				1 = " 1"
				2 = " 2"
				3 - HIGH = "3+";

run;

proc print data=work.occupancy;
format dogbreed $breed. smokers residents dogs nums.;
run;
