


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



data	avg_temps_farh;
set		city_temps_by_month_fahr ;
array	temps (12) month1 - month12 ;
max_temp = month1;
min_temp = month1;
avg_temp = 0;
do i = 1 to 12;
	if temps(i) > max_temp then max_temp = temps(i);
	if temps(i) < min_temp then min_temp = temps(i);
	avg_temp = avg_temp + temps(i);
end;
avg_temp = avg_temp / 12 ;
format avg_temp 8.2 ;
drop i ;
run;




data	boston_temperatures (keep = Month Temp_Fahrenheit Temp_Celsius);
set		city_temps_by_month_fahr ;
array	fahr (12) month1 - month12 ;
do Month = 1 to 12;
	Temp_Fahrenheit = fahr(Month) ;
	Temp_Celsius = (Temp_Fahrenheit - 32) / 9 * 5 ;
	if city = "Boston" then output ;
end;
format Temp_Fahrenheit Temp_Celsius 8.2 ;
run;
