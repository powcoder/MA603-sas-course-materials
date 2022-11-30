


proc sort data=data.accounts out=acct;
by acctnum;
run;


* sort by account number (as a number), eliminate duplicates ;
proc sort	data=data.accounts nodupkey out=accounts_sorted dupout=accounts_dupl 
			sortseq=linguistic (numeric_collation=on);
by			AcctNum ;
run;

proc sort	data=accounts_dupl 
			sortseq=linguistic ;
by			LastName ;
run;
