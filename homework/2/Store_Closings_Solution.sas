

data	Store_Closings;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0005\01\Store_Closings.txt"
		firstobs=2 truncover;
input	Store $1-5 Address $10-35 State $36-37 City $42-60 ;
format	City $upcase18.;
run ;
