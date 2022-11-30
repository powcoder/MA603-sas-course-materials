/************************/
/* MA 603 - Summer 2018 */
/* David Govonlu        */
/************************/

/* Exam 1 Part II Solutions */



libname exam1 "\\tsclient\David\Desktop\Teaching\MET MA 603\2018 Summer\Exams\Exam 1";



* Question 5 ;
proc sort data=exam1.ldfs out=ldfs ;
by maturity development_factor ;
run ;

proc sort data=ldfs nodupkeys dupout=ldfs_xlo ;
by maturity ;
run ;

proc sort data=ldfs_xlo ;
by maturity descending development_factor ;
run ;

proc sort data=ldfs_xlo nodupkeys dupout=ldfs_xhilo ;
by maturity ;
run ;

proc means data= ldfs_xhilo (drop=year) mean maxdec=4 ;
class maturity ;
run ;


* Question 6 ;
data	estimating_e ;
e = exp(1) ;
m = 0 ;
e_est = 1 ;
i = 0.0000001 ;
do until (abs(e - e_est) / e < i) ;
	m = m + 1 ;
	e_est = e_est + 1 / fact(m) ;
end ;
m = m + 1 ; * need to add 1 to account for the first term of 1/0! ;
format i percent12.5 ;
run ;
* 11 terms are needed ;


* Question 7 ;
proc import datafile="\\tsclient\David\Desktop\Teaching\MET MA 603\2018 Summer\Exams\Exam 1\exit_poll.csv"
			out=exit_poll replace;
run;

proc freq data=exit_poll;
tables Age Sex Party Voted Citizen Candidate ;
run;
* one obs has Age = 0, one has Age = 999 ;
* one obs misspeeld Male as Mlae ;
* one obs has Party = Every Day ;
* all obs have Voted = Yes ;
* two obs have candidates other than Jones or Grant, two are missing ;
* some values for candidates are in all capitals ;

data	exit_poll_cleaned (where=(candidate in ("Jones","Grant") and party~="Every Day"));
set		exit_poll (drop=Voted where=(age not in (0,999)));
candidate = propcase(candidate);
if sex = "Mlae" then sex = "Male";
run;

proc freq data=exit_poll_cleaned;
tables Age Sex Party Citizen Candidate ;
run;


* Question 8 ;
data	life_insurance ;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\2018 Summer\Exams\Exam 1\life_insurance.txt" truncover
		firstobs=2;
input	Birth mmddyy10. @13 Death mmddyy10. Cause $ PolicyLimit dollar18.;
format	Birth Death mmddyy10. PolicyLimit Dollar18.0;
run ;


* Question 9 ;
data	world_cup (drop=var space);
set		exam1.world_cup (where=(year>0));
length Winner $20 Score $6 RunnerUp $20;
space = anyspace(var);
Winner = substr(var,1,space-1);
var = substr(var,space+1);
space = anyspace(var);
Score = substr(var,1,space-1);
var = substr(var,space+1);
RunnerUp = substr(var,1);
run;
