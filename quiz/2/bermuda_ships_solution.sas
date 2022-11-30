

data	bermuda_ships;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0008\01\bermuda_ships.txt"
			firstobs=2;
input	Vessel $1-23 Type $24-54 Built 55-62 GT 63-71 DWT Size $80-91 ;
run;
