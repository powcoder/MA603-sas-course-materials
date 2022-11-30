


options mprint symbolgen mlogic  ;

* first solve a simple version without using macros ;
libname	_1000 "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\02_Lessons\027 Macros II\Work Folders\Input\Accounts\ACCT_1000";
libname	_1020 "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\02_Lessons\027 Macros II\Work Folders\Input\Accounts\ACCT_1020";
libname mapping "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\02_Lessons\027 Macros II\Work Folders\Mapping";

data	work.policies;
set		_1000.policies_acct_1000
		_1020.policies_acct_1020;
run;

proc sort data=policies;
by state;
run;
proc sort data=mapping.state_info (rename=(abbrv=state)) out=state_info;
by state;
run;

data	policies_with_subregion (where=(policynumber>.));
merge	policies
		state_info;
by		state;
run;

libname region "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\02_Lessons\027 Macros II\Work Folders\Output\AllPolicies\Midwest";

data	region.WestNorthCentral;
set		policies_with_subregion;
if		subregion = "West North Central";
run;


* now use macros to make solution more general ;
* create macro variables for each account ;
data	_NULL_;
set		mapping.accounts_list;
call	symput(compress(cat("acct",_N_)),compress(accountnumber));
call	symput("accounts",_N_);
run;
* check; %put &acct2;

%macro assign_acct_libraries;
	%do i = 1 %to &accounts;
		libname	a_&i "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\02_Lessons\027 Macros II\Work Folders\Input\Accounts\&&acct&i";
	%end;
%mend;
* note: can't use the macro variables for libnames since they are to long. use a_1, a_2, etc. instead;
%assign_acct_libraries;

%macro stack_accounts;
	data	work.policies;
	set		
			%do i = 1 %to &accounts;
				a_&i..policies_&&acct&i
			%end;
	;
	run;
%mend;
%stack_accounts;

proc sort data=policies;
by state;
run;
proc sort data=mapping.state_info (rename=(abbrv=state)) out=state_info;
by state;
run;

data	policies_with_subregion (where=(policynumber>.));
merge	policies
		state_info;
by		state;
run;

* create macro variables for Subregion and Region ;
proc sort data=mapping.state_info out=subregions;
by subregion;
run;

data	subregions;
set		subregions;
by		subregion;
if first.subregion;
run;

data	_NULL_;
set		work.subregions;
call	symput(compress(cat("subr",_N_)),compress(subregion));
call	symput(compress(cat("reg",_N_)),compress(region));
call	symput("subregions",_N_);
run;
*check;	%put &subr1 &reg1 &subregions;

%macro output_to_region;
	%do i = 1 %to &subregions;
		libname region "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\02_Lessons\027 Macros II\Work Folders\Output\AllPolicies\&&reg&i";

		data	region.&&subr&i;
		set		policies_with_subregion;
		if		compress(subregion) = "&&subr&i";
		run;
	%end;
%mend;
%output_to_region;
