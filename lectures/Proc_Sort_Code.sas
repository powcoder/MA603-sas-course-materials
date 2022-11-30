* Proc Sort ;



* create unsorted dataset ;
data	info ;
input	num txt $ ;
cards;
1 c
2 c
2 a
3 a
3 d
1 d
;
run;

* sorted by number ;
proc sort data=info out=info_sorted_by_num ;
by num ;
run;

* sorted by letter ;
proc sort data=info out=info_sorted_by_txt ;
by txt ;
run;

* sorted by number then letter ;
proc sort data=info out=info_sorted_by_num_txt ;
by num txt ;
run;

* sorted by letter then number ;
proc sort data=info out=info_sorted_by_txt_num ;
by txt num ;
run;

* sort by letter, descending number ;
proc sort data=info out=info_sorted_by_txt_numd ;
by txt descending num ;
run;


* the scores1 dataset is not sorted ;
libname data "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

proc sort data=data.scores1 out=scores1_sorted;
by score;
run;



* create dataset with missing data ;
data info_missing;
set info;
if num=3 and txt="d" then num =.;
if num=2 and txt = "c" then txt= "";
run;

proc sort data=info_missing out=infom_sorted_by_num ;
by num ;
run;

proc sort data=info_missing out=infom_sorted_by_num ;
by descending num ;
run;

proc sort data=info_missing out=infom_sorted_by_txt ;
by txt ;
run;

proc sort data=info_missing out=infom_sorted_by_txt ;
by descending txt ;
run;



data	txt_info ;
input	txt $ num;
cards;
C 1
c 2
a 3
A 3
d 5
D 6
11 7
100 8
* 9
- 10
% 11
[ 12
;
run;

* by default, observations are sorted based on ASCII code ;
proc sort data=txt_info out=txt_info_sorted;
by txt;
run;



* using the SORTSEQ option ;
proc sort data=txt_info out=txt_info_sorted sortseq=linguistic ;
by txt;
run;

proc sort data=txt_info out=txt_info_sorted sortseq=linguistic (numeric_collation=on);
by txt;
run;



* using DODUPKEY ;
proc sort data=info out=info_sorted nodupkey;
by num ;
run ;

proc sort data=info out=info_sorted nodupkey dupout=duplicates;
by num ;
run ;

* Create a dataset with the top scoring student from each School ;
proc sort data=data.scores1 out=top_students ;
by descending score ;
run;
proc sort data=top_students nodupkey;
by school;
run;
