* The Retain and Sum Statements ;


* example of Retain statement ;
* in order to calculate the running total, we need to know its
  value from the prior observation ;
data	sum_of_numbers_1;
set		mydata2.integers;
retain  running_total 0;
running_total = running_total + number;
run;

data	product_of_numbers;
set		mydata2.integers;
retain  running_product 1;
running_product = running_product * number;
run;



* example of Sum statement ;
* this achieves the same result as the first example,
  using a single statement ;
data	sum_of_numbers_2;
set		mydata2.integers;
		running_total + number;
run;
