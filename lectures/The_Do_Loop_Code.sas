* The Do Loop ;


* in the Do Loop, the index variable i increments by 1 by default ;
data	add_numbers_1;
total = 0;
do i = 1 to 100;
	total = total + i;
end;
drop i;
run;

* the increment can also be made explicit ;
data	add_numbers_1;
total = 0;
do i = 1 to 100 by 1;
	total = total + i;
end;
drop i;
run;

* the same result is achieved using a different increment ;
data	add_numbers_1;
total = 0;
do i = 100 to 1 by -1;
	total = total + i;
end;
drop i;
run;



* the Do While Loop iterates as long as the condition is true ;
* if there isn't a statement that will eventually cause the condition to be false,
  an infinite loop will result ;
data	add_numbers_2 (drop=i);
total = 0;
i = 1;
do while (i <= 100);
	total = total + i;
	i = i + 1;
end;
run;



* the Do Until Loop iterates until the condition is true ;
* if there isn't a statement that will eventually cause the condition to be true,
  an infinite loop will result ;
data	add_numbers_3;
total = 0;
i = 1;
do until (i > 100);
	total = total + i;
	i = i + 1;
end;
drop i;
run;

* the example below calculates the number of positive integers we must add to get to 1000 ;
* in this example we can't easily use the Do Loop with an Increment because we don't know how
  many times we will need to iterate ;
data	integers_to_get_to_1000;
total = 0;
i = 0;
do until (total >= 1000);
	i = i + 1;
	total = total + i;
end;
run;
