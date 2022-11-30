libname mydata "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

data	heights_m heights_f;
set		mydata.heights;
if sex = "M"	then output heights_m;
				else output heights_f;
run;
