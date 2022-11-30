
libname in_data "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

* use proc sort to eliminate duplicate IDs;
proc sort data=in_data.hair_and_eye_color out=hair_and_eye_color nodupkey;
by ID;
run;

proc freq data=hair_and_eye_color;
tables haircolor eyecolor haircolor * eyecolor / list;
run;

data	green_eyed_people (drop=eyecolor);
set		hair_and_eye_color (where=(eyecolor="Green"));
run;
