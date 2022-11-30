


data	work.sum;
set		mydata2.losses;
format Amount running_total comma18.;
running_total + amount;
run;



data	work.sum_post2010;
set		mydata2.losses;
format Amount total_post2010 comma18.;
retain total_post2010 0;
if year(date) > 2010 then total_post2010 = total_post2010 + amount;
run;



data	work.sum_by_flag;
set		mydata2.losses;
format Amount total_0 total_1 comma18.;
retain total_0 0 total_1 0;
if weatherflag = 1 then total_1 = total_1 + amount;
				   else total_0 = total_0 + amount;
run;
