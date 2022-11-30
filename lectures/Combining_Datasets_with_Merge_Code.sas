* Combining Datasets with Merge ;



data	cities ;
input	City $ :18. State : $18.;
datalines;
Austin Texas
Boise Idaho
Boston Massachusetts
Cambridge Massachusetts
Cincinnati Ohio
Cleveland Ohio
Columbus Ohio
Dallas Texas
Denver Colorado
;
run;

data	city_populations ;
input	City : $18. Population ;
datalines;
Austin 790390
Boise 205671
Boston 617594
Cambridge 107289
Cincinnati 297517
Cleveland 390113
Columbus 822553
Dallas 1258000
Denver 600158
;
run;

data	regions ;
input	State : $18. Region : $12. ;
datalines;
Colorado West
Idaho West
Massachusetts Northeast
Ohio Midwest
Texas South
;
run;


* one-to-one merge ;
data	cities_with_pop ;
merge	cities
		city_populations ;
by		city ;
run ;


* datasets must be sorted according to the BY variable ;
proc sort data=cities out=cities_sort_by_state ;
by state;
run;

data	cities_with_pop_error ;
merge	cities_sort_by_state
		city_populations ;
by		city ;
run ;



* one-to-many merge ;
* first sort in same order ;
proc sort data=cities_with_pop ;
by state ;
run ;

data	cities_with_pop_and_region ;
merge	cities_with_pop 
		regions ;
by		state ;
run ;


* if an observation for a BY variable is in one dataset but not the other,
  missing values will be generated ;
data	regions_nomidwest ;
set		regions ;
if region ~= "Midwest";
run;

data	cities_with_pop_and_region ;
merge	cities_with_pop 
		regions_nomidwest ;
by		state ;
run ;


* case matters when merging ;
data	regions_capmidwest ;
set		regions ;
if region = "Midwest" then state = UPCASE(state) ;
run;

* note that result is the union of the two datasets ;
data	cities_with_pop_and_region ;
merge	cities_with_pop 
		regions_capmidwest ;
by		state ;
run ;
