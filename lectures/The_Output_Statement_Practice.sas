


libname mydata3 "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";
data	i1 i2 i3 i4;
set		mydata3.integers;
if mod(number, 2) = 1 then output i1;
					  else output i2;
if mod(number, 3) = 0 then output i3;
if mod(number, 4) = 0 then output i4;
run;



data	i1 i2 i3 i4;
do number = 1 to 100;
if mod(number, 2) = 1 then output i1;
					  else output i2;
if mod(number, 3) = 0 then output i3;
if mod(number, 4) = 0 then output i4;
end;
run;
