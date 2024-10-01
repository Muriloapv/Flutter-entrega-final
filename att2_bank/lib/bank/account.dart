class Account<T> {
  T _accountHolder; // O titular da conta pode ser de qualquer tipo (por exemplo, Pessoa Física, Pessoa Jurídica)
  double _balance;

  Account(this._accountHolder, this._balance);

  T get accountHolder => _accountHolder;
  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
    }
  }
}
