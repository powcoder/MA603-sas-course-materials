


proc freq data=data3.election ;
tables washington_result * incumbent_result ;
run;

* one observation for Washington_Result is "wins", while the rest are "win" ;

data	election ;
set		data3.election ;
if washington_result = "wins" or washington_result = "win" then wash_res = 1 ;
else wash_res = 0 ;
if incumbent_result = "wins" then inc_res = 1 ; else inc_res = 0 ;

if wash_res = inc_res then theory=1; else theory=0;
run;

proc freq data=election ;
tables wash_res * inc_res ;
run;

proc corr data=election ;
var wash_res inc_res ;
run ;
