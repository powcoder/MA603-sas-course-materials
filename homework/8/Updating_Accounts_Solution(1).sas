
libname data "\\tsclient\David\Desktop\Teaching\MET MA 603\Datasets";

* there are many ways this could be solved ;

* 1. merge transactions to balances. need to sort by account number first ;
proc sort data=data.account_balances out=work.account_balances;
by account_number;
run;
proc sort data=data.daily_transactions out=work.daily_transactions;
by account_number;
run;

data	accounts_with_trans ;
merge	account_balances (rename=(amount=prior_balance))
		daily_transactions;
by		account_number;
if amount = . then amount = 0;
run;

* 2. Sort by account number and transaction_id so that we can go through the transactions
	 for each account in order ;
proc sort data=accounts_with_trans;
by account_number transaction_id;
run;

* 3. need to retain Balance so that we can add the amounts to it
	 Debits need to be negative amounts
	 when we get to a new account number (first.account_number=1) then we need to reset the balance
	 if the amount would cause the balance to be < 0 we should output the record to canceled_transactions
	 otherwise add the amount to the balance
	 when we get to the last transaction of the account, then we output the record to accounts_balances_updated;
data	accounts_balances_updated (keep=account_number balance)
		canceled_transactions (keep=account_number transaction_id amount);
set		accounts_with_trans;
by		account_number transaction_id;
format	Balance dollar18.;
retain	balance 0;
if transaction = "Debit" then amount = -amount;
if first.account_number then balance = prior_balance;
if balance + amount < 0 then output canceled_transactions;
else balance = balance + amount;
if last.account_number then output accounts_balances_updated;
run;
