


proc sort data=data2.losses (drop=weatherflag) out=losses;
by descending amount ;
run ;

data	losses_2014 ;
set		losses ;
by		descending amount ;
if		year(date) = 2014 ;
run;

data	top_5_losses_2014 ;
set		losses_2014 ;
if _N_ <= 5 ;
format amount dollar8. ;
run;



data	losses_2014 ;
set		data2.losses (drop=weatherflag) ;
if		year(date) = 2014 and amount > 9999;
r = rand("Uniform");
format amount dollar8. ;
run;

proc sort data=losses_2014 out=loss_sample (drop=r) ;
by r ;
run;

data	loss_sample ;
set		loss_sample ;
if _N_ <= 5 ;
run ;
