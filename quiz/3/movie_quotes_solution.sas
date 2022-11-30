
data	movie_quotes ;
infile	"\\tsclient\David\Desktop\Teaching\MET MA 603\Problems\P0010\01\movie_quotes.txt"
		delimiter="|" truncover;
length	Number 3 Quote $210 Movie $24;
input	Number 1-3 +1 Quote $quote210. +1 Movie $ Year mmddyy10.;
format	Year mmddyy10. ;
run;
