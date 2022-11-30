* Combining Datasets with Set ;


data	integers_odd integers_even;
do number = 1 to 100;
	if mod(number,2) = 1 then output integers_odd;
						 else output integers_even;
end;
run;

* combining Datasets using SET (stack);
data	integers_stack;
set		work.integers_odd
		work.integers_even;
run;



* combining Datasets using SET (interleave) ;
data	integers_interleave;
set		work.integers_odd
		work.integers_even;
by number;
run;

* errors will occur if the datasets are not sorted correctly ;
proc sort data=integers_odd;
by descending number;
run;

data	integers_interleave;
set		work.integers_odd
		work.integers_even;
by number;
run;
