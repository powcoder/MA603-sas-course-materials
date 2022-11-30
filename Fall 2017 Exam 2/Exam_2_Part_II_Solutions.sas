
/* Exam 2 Part II Solutions */

libname exam2 "\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\06_Exams\Exam 2";



* Question 6 ;

proc sort data=exam2.diving  out=diving;
by diver score;
run;

data	diving_final_scores (keep=diver final_score);
set		diving;
by		diver score;
format	Final_score 8.3;
retain final_score 0;
if first.diver then final_score = 0;
if not (first.diver or last.diver) then final_score = final_score + score;
if last.diver then do;
	final_score = final_score / 3;
	output;
end;
run;


* Question 7 ;
proc sort data=exam2.car_orders out=car_orders;
by model;
run;
proc sort data=exam2.base_model_price_list out=base_model_price_list;
by model;
run;

data	car_orders_base;
merge	car_orders
		base_model_price_list;
by		model;
Var = 1;
run;

data	special_features_price_list;
set		exam2.special_features_price_list;
Var = 1;
run;

data	car_orders_all (keep=order model total_price);
merge	car_orders_base
		special_features_price_list;
by		var;
array	Inds (13) leather_seats_ind -- wifi_ind;
array	prices (13) leather_seats -- wifi;
Total_Price = price;
do i = 1 to 13;
	if inds(i) = 1 then total_price = total_price + prices(i);
end;
format total_price dollar12.0;
run;

proc sort data=car_orders_all;
by order;
run;


* Question 8 ;
data	_NULL_;
set		exam2.base_model_price_list;
file	"\\tsclient\David\Desktop\Teaching\MET MA 603\2017 Fall\06_Exams\Exam 2\ModelPrices.txt";
put		"SAS-Honda" +1 model $upcase10. price dollar8.0;
run;


* Question 9 ;
data	dow_jones (keep=daycount pricechange);
set		exam2.dow_jones;
DayCount = _N_;
retain priorclosingprice 0;
PriceChange = closingprice - priorclosingprice;
priorclosingprice = closingprice;
if _N_ > 1 then output; * don't have price prior to 1/2/1900 so we can't calculate the change;
run;

data	dow_jones_offset (rename=(pricechange=PriorPriceChange));
set		dow_jones;
DayCount = Daycount + 1;
run;

data	dow_jones_corr (where=(pricechange > . and priorpricechange > .));
merge	dow_jones
		dow_jones_offset;
by		daycount;
run;

proc corr data=dow_jones_corr;
var priorpricechange;
with pricechange;
run;

* correlation is 0.0254, close to 0, so almost no relationship between prior and next price change ;


* Question 10 ;
%macro diver(diver);

	data	&diver._dives;
	set		exam2.diving;
	if diver = "&diver";
	run;

%mend;
%diver(Viger);
%diver(Roca);
* can also use (where=(diver = "&diver"));
