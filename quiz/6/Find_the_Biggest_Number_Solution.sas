
libname data "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

data	biggest_number (keep=maxnum);
set		data.numbers ;
retain maxnum num1;
array nums (1000) num1-num1000;
do i = 1 to 1000;
	maxnum = max(maxnum, nums(i));
end;
if _N_ = 1000 ;
format maxnum comma12.0;
run;
