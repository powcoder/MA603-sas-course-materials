

*problem 1;
data	primes1;
seed = 5490;
do i = 1 to 75;
	seed2 = seed ** 2;
	d2 = int(seed2 / 1000000);
	seed3 = seed2 - d2 * 1000000;
	seed4 = int(seed3 / 100);
	seed = seed4;
	output;
end;
keep seed ;
run;
proc freq data=primes1;
run;
proc means data=primes1 mode maxdec=0;
run;

* for a starting value of 1234, the sequence goes to 0 and 0 repeats ;
* for a starting value of 7704, the values 2100, 4100, 6100, and 8100 repeat ;
* for a starting value of 5490 does not repeat over the first 75 numbers ;


*problem 2;
data	primes2 (keep= primes1-primes25);
seed1 = 5073;
seed2 = 6111;
array	seeds (2) seed1 seed2;
array	primes (25);
do j = 1 to 2;
	primes(1) = seeds(j);
	do i = 2 to 25;
		s2 = primes(i-1) ** 2;
		d2 = int(s2 / 1000000);
		s3 = s2 - d2 * 1000000;
		s4 = int(s3 / 100);
		primes(i) = s4;
	end;
	output;
end;
run;
