import 'package:inheritance/inheritance.dart' as inheritance;

void main(List<String> arguments) {

  // var ca_Summiyal = CurrentAccount();
  // ca_Summiyal.accountTitle = "Summiyal";
  // ca_Summiyal.depositCash(500);

  // var ca_Samiya = CurrentAccount();
  // ca_Samiya.accountTitle = "Samiya";
  // ca_Samiya.depositCash(1000);

  // var ca_Ali = CurrentAccount();
  // ca_Ali.accountTitle = "Ali";
  // ca_Ali.depositCash(10000);    // 24-06-2024
  // ca_Ali.depositCash(5000);     // 25-06-2024
  // ca_Ali.withdrawCash(9000);    // 26-06-2024
  // ca_Ali.withdrawCash(10000);    // 28-06-2024
  // ca_Ali.withdrawCash(810);    // 28-06-2024
  // ca_Ali.depositCash(10000);
  // ca_Ali.deductDebitCardCharges();
  // ca_Ali.transfer(ca_Summiyal, 2000);

  // ca_Summiyal.transfer(ca_Samiya, 5000);

  // ca_Samiya.transfer(ca_Ali, 10000);

  // var sa_Maryam = SavingAccount(200000); // account opened
  // sa_Maryam.accountTitle = "Maryam";
  // sa_Maryam.depositCash(5000);
  // sa_Maryam.depositCash(100000);
  // sa_Maryam.withdrawCash(3000);

  // var sa_Mesum = SalaryAccount();
  // sa_Mesum.accountTitle = "Mesum";
  // sa_Mesum.depositCash(50000);

  // var ca_Arsalan = CurrentAccount();
  // ca_Arsalan.accountTitle = "Arsalan";
  // ca_Arsalan.depositCash(5000);

  // var sa_Usman = SalaryAccount();
  // sa_Usman.accountTitle = "Usman";
  // sa_Usman.depositCash(50000);
  // sa_Usman.withdrawCash(25000);

  var car = Car();
  car.break_();
  car.speed();
  car.steer();
  car.ignition();

  var bus = Bus();
  bus.break_();
  bus.speed();
  bus.steer();
  bus.ignition();

  var tank = Tank();
  tank.break_();
  tank.speed();
  tank.steer();
  tank.ignition();

}

class BankAccount {
  double openingBalance = 0;
  double balance = 0;
  String accountNumber = "MCB354034234782389";
  String debitCartType = "Silver";
  String accountTitle = "";
  double withdrawLimit = 5000;

  void depositCash(double cash) {
    if (cash <= 0) {
      print("$accountTitle Invalid amount entered.");
    }
    else {
      balance = openingBalance + balance + cash;
      openingBalance = 0;
      print("$accountTitle You have deposited $cash.");
      print("$accountTitle Your new balance is $balance.");
    }
  }

  void withdrawCash(double cash) {
    if (cash > withdrawLimit) {
      print("$accountTitle Enter amount is more than limit, your limit is $withdrawLimit.");
    }
    else if (cash <= 0) {
      print("$accountTitle Invalid amount entered.");
    }
    else if (cash > balance) {
      print("$accountTitle insufficient balance");
    }
    else {
      var transactionFee = cash * 1 / 100;
      balance = balance - cash - transactionFee;
      print("$accountTitle You have Withdrawn $cash.");
      print("$accountTitle Your new balance is $balance.");
    }
  }

  void deductDebitCardCharges() {

    var debitCardCharges = 2500;

    if (debitCartType == "Gold") {
      debitCardCharges = 5000;
    }
    else if (debitCartType == "Platinium") {
      debitCardCharges = 7000;
    }

    balance = balance - debitCardCharges;
    print("balance after debit card charges $balance");
  }

  void transfer(BankAccount beneficiary, double amount) {
    if (amount > 0) {
      beneficiary.balance = beneficiary.balance + amount;
      print("${beneficiary.accountTitle}, You have received $amount from $accountTitle, new balance is ${beneficiary.balance}");

      balance = balance - amount;
      print("$accountTitle, Transfer successful amount to Rs. $amount to account ${beneficiary.accountTitle}, new balance is $balance");
    }
    else {
      print("$accountTitle, transfer amount is invalid");
    }
  }
}

class CurrentAccount extends BankAccount {
  @override
  double openingBalance = 5000;
}

class SavingAccount extends BankAccount {
  @override
  double openingBalance = 100000;

  @override
  double withdrawLimit = 0;

  SavingAccount(double openbalance) {
    openingBalance = openbalance;
  }

  @override
  void depositCash(double cash) {
    if (cash <= 0) {
      print("$accountTitle Invalid amount entered.");
    }
    else {
      balance = openingBalance + balance + cash + (cash * 1 / 100);
      openingBalance = 0;
      print("$accountTitle You have deposited $cash.");
      print("$accountTitle Your new balance is $balance.");
    }
  }
}

class SalaryAccount extends BankAccount {
  @override
  double openingBalance = 25000;

  @override
  double withdrawLimit = 25000;
  
  @override
  void depositCash(double cash) {
    if (cash <= 0) {
      print("$accountTitle Invalid amount entered.");
    }
    else {
      balance = openingBalance + balance + cash - (cash * 1 / 100);
      openingBalance = 0;
      print("$accountTitle You have deposited $cash.");
      print("$accountTitle Your new balance is $balance.");
    }
  }
}

class ChildAccount extends BankAccount {
  @override
  double openingBalance = 0;

  @override
  double withdrawLimit = 0;
}

/*  ABSTRACTION   (DATA HIDING)*/

abstract class vehicle {
  void break_();
  void speed();
  void steer();
  void ignition();
}

class Car implements vehicle {
  @override
  void break_() {
    print("Break applied on Car.");
  }

  @override
  void ignition() {
    print("Ignition started in Car.");
  }

  @override
  void speed() {
    print("Speed increased in Car.");
  }

  @override
  void steer() {
    print("Steering the Car.");
  }
}

class Bus implements vehicle {
  @override
  void break_() {
    print("Break applied on Bus.");
  }

  @override
  void ignition() {
    print("Ignition started in Bus.");
  }

  @override
  void speed() {
    print("Speed increased in Bus.");
  }

  @override
  void steer() {
    print("Steering the Bus.");
  }
}

class Tank implements vehicle {
  @override
  void break_() {
    print("Break applied on Tank.");
  }

  @override
  void ignition() {
    print("Ignition started in Tank.");
  }

  @override
  void speed() {
    print("Speed increased in Tank.");
  }

  @override
  void steer() {
    print("Steering the Tank.");
  }
}