
libname indata "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

data	_NULL_;
file	"\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets\transactions.txt";
set		indata.daily_transactions;
Date = today();
put		Date date9. @12 Transaction_ID @19 Account_Number @30 Transaction @38 Amount dollar16.2;
run;
