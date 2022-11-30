/**********************/
/* MA 603 - Fall 2016 */
/* David Govonlu      */
/**********************/

/* Exam 2 Part II Solutions */


options mlogic symbolgen mprint ;
libname exam "\\tsclient\Teaching\MET MA 603\2016 Fall\04_Evaluation\Exams\Exam 2";



* Question 6 ;
data	fibo (keep=f);
f1 = 1 ;
f = f1 ; output ;
f2 = 1 ;
f = f2 ; output ;
do i = 1 to 1000 ;
	f = f1 + f2 ;
	f1 = f2 ;
	f2 = f ;
	output ;
end ;
run ;

data	term_50 ;
set		fibo ;
if _N_ = 50 ;
run ;



* Question 7 ;
data	quiz_results (keep=student average);
set		exam.quiz_results ;
array q Quiz1-Quiz8 ;
format average 8.1 ;
s = 0 ;
m = 100 ;
do i = 1 to 8 ;
	s = s + q(i);
	if q(i) < m then m = q(i) ;
end;
average = (s - m) / 7 ;
run;

proc sort data=quiz_results ;
by descending average ;
run ;



* Question 8 ;
data	quiz8_avg (keep=avg8 min8 max8) ;
set		exam.quiz_results ;
retain  min8 100 max8 0 ;
sum8 + quiz8 ;
avg8 = sum8 / _N_ ;
if quiz8 < min8 then min8 = quiz8 ;
if quiz8 > max8 then max8 = quiz8 ;
if _N_ = 20 ;
run ;

proc means data=exam.quiz_results min max mean maxdec=2;
var quiz8 ;
run ;



* Question 9 ;
data	quiz8 (keep=student quiz8 minutes);
merge	exam.quiz_results
		exam.study_time ;
run ;

proc corr data=quiz8 ;
with quiz8 ;
run ;



* Question 10 ;
proc sort data=exam.address_book out=address_book;
by lastname;
run;

data	_null_ ;
set		address_book ;
file 	"\\tsclient\Teaching\MET MA 603\2016 Fall\01_Documents\Address_Book.txt";
put _N_ 2. "." @5 LastName @26 FirstName @46 "(" Area_Code 3. ")" +1 Phone_Number ;
run;



* Question 11 ;
proc sort	data=exam.user_database
			out=user_database ;
by	username password ;
run;
 
data	user_database;
set		user_database;
	userind = 1 ;
run;
 
 
%macro password_check(username, password);

data  entered ;
username = "&username";
pass = "&password" ;
run;

data 	match ;
merge	user_database
		entered ;
by	username ;
if	username = "&username" ;
if	pass = password then passind = 1;
run;

data 	_null_;
set		match ;
call symput("u", userind);
call symput("p", passind);
run;

%if &u = . %then %put "User name can not be found" ;
%else %if &p = . %then %put "Password is wrong";
%else %put "Password is correct";
%mend;


options nomprint nosymbolgen nomlogic ;
%password_check(Allegra_286, chevy);
%password_check(Allegra_286, chevy1);
%password_check(Allegra_2861, chevy);
options mprint symbolgen mlogic ;
