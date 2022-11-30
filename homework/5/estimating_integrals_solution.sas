
* First integral, w = 0.1 ;
data	reiman_sum_1 (keep=R);
R = 0.0 ;
a = 0.2 ;
b = 0.8 ;
w = 0.1 ;
do x = a to b-w by w ;
	R = R + w * x ** (1/3);
end;
run;

* First integral, w = 0.01 ;
data	reiman_sum_2 (keep=R);
R = 0.0 ;
a = 0.2 ;
b = 0.8 ;
w = 0.01 ;
do x = a to b-w by w ;
	R = R + w * x ** (1/3);
end;
run;

* First integral, w = 0.000001 ;
data	reiman_sum_3 (keep=R);
R = 0.0 ;
a = 0.2 ;
b = 0.8 ;
w = 0.000001 ;
do x = a to b-w by w ;
	R = R + w * x ** (1/3);
end;
run;

* Second integral, w = 0.000001 ;
data	reiman_sum_4 (keep=R);
R = 0.0 ;
a = 0.0 ;
b = 1.0 ;
w = 0.000001 ;
do x = a to b-w by w ;
	R = R + w * log(3 + cos(10 * x)) ** (3 * x + 1);
end;
run;
