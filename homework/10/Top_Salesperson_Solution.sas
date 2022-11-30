
libname indata "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

%macro sales_reports(day);
	* calculate total sales for the day ;
	proc means data=indata.sales_&day sum maxdec=0;
	title "Daily Sales";
	footnote "&day";
	run;

	* sort by descending sales and get the first observation ;
	proc sort data=indata.sales_&day out=topperson;
	by descending sales;
	run;
	data	topperson;
	set		topperson;
	if _N_ = 1;
	run;
	proc print data=topperson;
	title "Top Salesperson for &day";
	footnote;
	run;

	* sort cumulative and daily sales by salesperson ;
	proc sort data=indata.cumulative_sales_2017;
	by salesperson;
	run;
	proc sort data=indata.sales_&day out=daily_sales;
	by salesperson;
	run;
	* merge cumulative and daily datasets. use rename to make it easy to add daily to cumulative ;
	data	indata.cumulative_sales_2017 (drop=dailysales);
	merge	indata.cumulative_sales_2017
			daily_sales (rename=(sales=dailysales));
	Sales = Sales + dailysales;
	run;
	* sort by the new cumulative sales ;
	proc sort data=indata.cumulative_sales_2017;
	by descending sales;
	run;
	* getting top 3 is similar to the top daily person ;
	data	cumulative_top3;
	set		indata.cumulative_sales_2017;
	if _N_ <= 3;
	run;
	proc print data=cumulative_top3;
	title "Top Salespersons through &day";
	footnote;
	run;
%mend;
%sales_reports(2017_11_01);
%sales_reports(2017_11_02);
%sales_reports(2017_11_03);
%sales_reports(2017_11_04);
%sales_reports(2017_11_05);
%sales_reports(2017_11_06);
%sales_reports(2017_11_07);
