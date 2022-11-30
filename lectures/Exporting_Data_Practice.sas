


PROC EXPORT DATA= DATA3.HEIGHTS 
            OUTFILE= "C:\Users\dgovonlu\Desktop\heights.txt" 
            DBMS=TAB REPLACE;
     PUTNAMES=YES;
RUN;



proc export data=data3.accounts
	outfile="C:\Users\dgovonlu\Desktop\accounts.txt" replace;
delimiter = "_" ;
run;



data	_null_;
file	"C:\Users\dgovonlu\Desktop\heights.txt";
set		data3.heights;
put		Person "(" sex $1. ")" @18 height 8.0 """";
run;
