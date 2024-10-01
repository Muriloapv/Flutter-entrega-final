class Transaction<T> {
  T sender;
  T receiver;
  double amount;

  Transaction(
      {required this.sender, required this.receiver, required this.amount});

  void executeTransaction() {
    sender.withdraw(amount);
    receiver.deposit(amount);
  }
}
