* Libraries ;



* this statement assigns the library name myLib to a folder on the desktop ;
libname myLib "C:\Users\govonlu\Desktop\Data";

* note that when using the remote app, the path to get to the local machine
  will be different ;
* Tools>>New Library>>Browse can be used to determine the path to the local machine ;
libname myLib "\\tsclient\David\Desktop\Data";



* the dataset will be created in the Work library ;
data	distance;
Miles = 26.22;
Kilometers = 1.61 * Miles;
run;


* the dataset will be created in the Work library ;
data	work.distance;
Miles = 26.22;
Kilometers = 1.61 * Miles;
run;


* the dataset will be created in the myLib library ;
data	mylib.distance;
Miles = 26.22;
Kilometers = 1.61 * Miles;
run;



* this statement re-assigns the library name myLib to a different folder ;
libname myLib "C:\Users\govonlu\Desktop\Data2";


* this statement clears the library myLib ;
libname mylib clear;


* this statement clears all libraries ;
libname _all_ clear;



