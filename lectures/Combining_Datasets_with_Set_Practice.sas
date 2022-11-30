


libname data3 "\\tsclient\Teaching\MET MA 603\Datasets";

data	losses_wx;
set		data3.losses_weather;
weatherflag = "1";
run;

data	losses_nw;
set		data3.losses_nonweather;
weatherflag = "0";
run;

data	losses_flag;
set		losses_nw
		losses_wx;
run;



* easiest way is to just sort losses_flag ;
proc sort data=losses_flag out=losses_date;
by date;
run;



* alternatively, each dataset can be sorted, and the results interleaved ;
proc sort data=losses_nw;
by date;
run;

proc sort data=losses_wx;
by date;
run;

data	losses_date;
set		losses_nw
		losses_wx;
by		date;
run;
