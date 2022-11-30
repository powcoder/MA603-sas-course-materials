

* delimited data ;
* temporary dataset ;
Data	Forecast ;
length Day $3 Icon Description $18;
input	Day Icon & Description & Hi_Temp Lo_Temp ;
datalines;
THU Partly Cloudy  Cool 60s Coast  73 58
FRI Sunny  70s Cape Cod  86 55
SAT Dark Clouds  More Humid  89 66
SUN Cloudy  Cooler & Damp  59 56
MON Mostly Cloudy  Memorial Day  61 53
TUE Partly Cloudy  Partial Clearing  72 55
WED Sunny  Pleasently Warm  82 58
;
run;


* fixed-width data ;
* permanent dataset ;

libname mydata "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

Data	mydata.Forecast ;
length Day $3 Icon Description $18;
input	Day 1-3 Icon 5-17 Description 20-35 Hi_Temp 37-38 Lo_Temp 40-41;
datalines;
THU Partly Cloudy  Cool 60s Coast   73 58
FRI Sunny          70s Cape Cod     86 55
SAT Dark Clouds    More Humid       89 66
SUN Cloudy         Cooler & Damp    59 56
MON Mostly Cloudy  Memorial Day     61 53
TUE Partly Cloudy  Partial Clearing 72 55
WED Sunny          Pleasently Warm  82 58
;
run;
