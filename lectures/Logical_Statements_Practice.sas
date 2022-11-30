


libname	mydata	"C:\Users\govonlu\Desktop\Datasets2";

data	grades;
set		mydata.scores1;
if score >= 90 then Grade = "A";
else if score >= 80 then Grade = "B";
else if score >= 70 then Grade = "C";
else if score >= 60 then Grade = "D";
else Grade = "F";
run;



data	mydata.discounts;
set		mydata.policy_info;

length RoofQuality $6;
format RoofQualityFactor AlarmFactor 8.2;

if upcase(rooftype) in ("WOOD SHAKE", "WOOD SHINGLES", "BUILT UP/TAR OR GRAVEL") then RoofQuality = "Poor";
else if upcase(rooftype) in ("ASPHALT", "OTHER", "TIN/MEMBRANE") then RoofQuality = "Normal";
else RoofQuality = "Good";

if roofquality = "Normal" or form = "HO4" then RoofQualityFactor = 1;
else if roofquality = "Good" then RoofQualityFactor = 0.9;
else if form = "HO3" then RoofQualityFactor = 1.1;
else RoofQualityFactor = 1.05;

if BurglarAlarm = "Central" then do;
		if		FireAlarm = "Central"	then AlarmFactor = 0.85;
		else if	FireAlarm = "Local"		then AlarmFactor = 0.90;
		else								 AlarmFactor = 0.95;
		end;
else if BurglarAlarm = "Local" then do;
	 	if		FireAlarm = "Central"	then AlarmFactor = 0.90;
		else if	FireAlarm = "Local"		then AlarmFactor = 0.97;
		else								 AlarmFactor = 0.99;
		end;
else								do;
		if		FireAlarm = "Central"	then AlarmFactor = 0.95;
		else if	FireAlarm = "Local"		then AlarmFactor = 0.99;
		else								 AlarmFactor = 1.00;
		end;
run;
