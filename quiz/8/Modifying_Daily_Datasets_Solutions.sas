libname mydata "C:\Users\govonlu\Desktop\MA 603\Datasets\ClaimsData\ClaimsData";

%macro combine_and_convert;
	data	claims_july_char;
	set		%do i = 1 %to 31;
			mydata.claims_july_&i
			%end;
			;
	run;
	Data	claims_july (drop=amount_char);
	Set		claims_july_char (rename=(Amount=Amount_Char));
	Amount = Amount_Char + 0;
	Run;
%mend;
%combine_and_convert;

%macro Convert_and_combine;
	%do i = 1 %to 31;
	Data	claims_july_&i (drop=amount_char);
	Set		mydata.claims_july_&i (rename=(Amount=Amount_Char));
	Amount = Amount_Char + 0;
	Run;
	%end;
	;

	data	claims_july;
	set		%do i = 1 %to 31;
			claims_july_&i
			%end;
				;
	run;
%mend;
%Convert_and_combine;
