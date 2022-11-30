
libname indata "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

proc corr data=indata.college_seniors;
with college_gpa;
run;

* high_school_gpa has the highest correlation with college_gpa ;

proc reg data=indata.college_seniors;
model college_gpa = high_school_gpa;
run;

* model has p-value < 0.05, which indicates a good fit ;
* intercept is 1.19437 and slope is 0.51483 ;

data	incoming_students_predicted_gpa;
set		indata.incoming_students;
format	College_GPA 8.2;
College_GPA = 1.19437 + 0.51483 * high_school_gpa;
run;

* text file ;
data	_null_;
file	"\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets\incoming_students_predicted_gpa.txt";
set		incoming_students_predicted_gpa;
if _N_ = 1 then put "Student" @18 "Predicted GPA";
put		Student @18 College_GPA 8.1;
run;
