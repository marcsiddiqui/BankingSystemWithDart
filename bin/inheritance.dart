import 'package:inheritance/inheritance.dart' as inheritance;

void main(List<String> arguments) {

  var ca_Summiyal = CurrentAccount();
  ca_Summiyal.account_title = "Summiyal";
  ca_Summiyal.DepositCash(500);

  var ca_Samiya = CurrentAccount();
  ca_Samiya.account_title = "Samiya";
  ca_Samiya.DepositCash(1000);

  var ca_Ali = CurrentAccount();
  ca_Ali.account_title = "Ali";
  ca_Ali.DepositCash(10000);    // 24-06-2024
  ca_Ali.DepositCash(5000);     // 25-06-2024
  ca_Ali.WithdrawCash(9000);    // 26-06-2024
  ca_Ali.WithdrawCash(10000);    // 28-06-2024
  ca_Ali.WithdrawCash(810);    // 28-06-2024
  ca_Ali.DepositCash(10000);
  ca_Ali.DeductDebitCardCharges();
  ca_Ali.Transfer(ca_Summiyal, 2000);

  ca_Summiyal.Transfer(ca_Samiya, 5000);

  ca_Samiya.Transfer(ca_Ali, 10000);

  // var sa = SalaryAccount();
  // sa.DepositCash(-10000);
  // sa.WithdrawCash(15000);

  // var sva = SavingAccount(100000);
  // sva.DepositCash(10000);
}

class BankAccount {
  double opening_balance = 0;
  double balance = 0;
  String account_number = "MCB354034234782389";
  String DebitCartType = "Silver";
  String account_title = "";

  void DepositCash(double cash) {
    if (cash < 0) {
      print("${account_title} Invalid amount entered.");
    }
    else {
      balance = opening_balance + balance + cash;
      opening_balance = 0;
      print("${account_title} You have deposited ${cash}.");
      print("${account_title} Your new balance is ${balance}.");
    }
  }

  void WithdrawCash(double cash) {
    if (cash < 0) {
      print("${account_title} Invalid amount entered.");
    }
    else if (cash > balance) {
      print("${account_title} insufficient balance");
    }
    else {
      var transaction_fee = cash * 1 / 100;
      balance = balance - cash - transaction_fee;
      print("${account_title} You have Withdrawn ${cash}.");
      print("${account_title} Your new balance is ${balance}.");
    }
  }

  void DeductDebitCardCharges() {

    var debitCardCharges = 2500;

    if (DebitCartType == "Gold") {
      debitCardCharges = 5000;
    }
    else if (DebitCartType == "Platinium") {
      debitCardCharges = 7000;
    }

    balance = balance - debitCardCharges;
    print("balance after debit card charges ${balance}");
  }

  void Transfer(BankAccount beneficiary, double amount) {
    if (amount > 0) {
      beneficiary.balance = beneficiary.balance + amount;
      print("${beneficiary.account_title}, You have received ${amount} from ${account_title}, new balance is ${beneficiary.balance}");

      balance = balance - amount;
      print("${account_title}, Transfer successful amount to Rs. ${amount} to account ${beneficiary.account_title}, new balance is ${balance}");
    }
    else {
      print("${account_title}, transfer amount is invalid");
    }
  }

}

class CurrentAccount extends BankAccount {
  @override
  double opening_balance = 5000;
}

class SavingAccount extends BankAccount {
  @override
  double opening_balance = 100000;

  SavingAccount(double openbalance) {
    opening_balance = openbalance;
  }
}

class SalaryAccount extends BankAccount {
  @override
  double opening_balance = 25000;
}

class ChildAccount extends BankAccount {
  @override
  double opening_balance = 0;
}