* Arrays ;



* create the city_temps_by_month_fahr dataset ;
data	city_temps_by_month_fahr ;
input	City : & $18. Month1 - Month12 ;
cards;
Washingon, D.C.  42 44 53 64 75 83 87 84 78 67 55 45
Boston  36 39 45 56 66 76 81 80 72 61 51 41
Miami  76 78 80 83 87 89 91 91 89 86 82 78
San Francisco  57 60 62 63 64 66 67 68 70 69 63 57
Minneapolis  24 29 41 58 69 79 83 80 72 58 41 27
;
run;



* defining an array and referring to values ;
* this example doesn't take advantage of the power of arrays ;
data	array_practice;
set		city_temps_by_month_fahr (keep=city month1 month2 month3);
array	q1 (3) month1 month2 month3 ;
q1(1) = (q1(1) - 32) / 9 * 5 ;
q1(2) = (q1(2) - 32) / 9 * 5 ;
q1(3) = (q1(3) - 32) / 9 * 5 ;
run;



* converting temperatures using Array and Do Loop ;
data	city_temps_by_month_cels;
set		city_temps_by_month_fahr;
array	temps(12) month1 - month12;
do i = 1 to 12;
	temps(i) = (temps(i) - 32) / 9 * 5 ;
end;
drop i;
format month1-month12 8.2;
run;



* using the double dash shorthand ;
data	scores;
set		mydata.scores;
format	quiz1--exam2 percent8.1;
array	score (5) quiz1--exam2;
do i = 1 to 5;
	score(i) = score(i) / 100;
end;
drop i;
run;
