
libname data "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

proc transpose data=data.ice_cream_sales out=ice_cream_sales (rename=(_NAME_=Date));
id metric;
run;

proc corr data=ice_cream_sales plots=matrix(histogram);
run;
