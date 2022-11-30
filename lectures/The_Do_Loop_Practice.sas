


* with MOD function and increment 1 ;
data	sum_of_evens (drop=i);
total = 0;
do i = 1 to 100 ;
	if mod(i,2) = 0 then total = total + i;
end;
run;

* with increment 2 ;
data	sum_of_evens (drop=i);
total = 0;
do i = 2 to 100 by 2 ;
	total = total + i;
end;
run;
