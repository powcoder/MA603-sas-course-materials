


proc transpose	data=mydata.height_and_weight_survey
				out=hw_data_transpose (drop=_name_);
by subject;
id metric;
format height weight 8.0;
run;
