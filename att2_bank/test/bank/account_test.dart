import 'package:test/test.dart';
import '../../lib/bank/account.dart';

void main() {
  group('Account', () {
    test('Deve depositar corretamente', () {
      Account<String> account = Account('João', 1000.0);
      account.deposit(500.0);
      expect(account.balance, equals(1500.0));
    });

    test('Deve sacar corretamente', () {
      Account<String> account = Account('Maria', 1000.0);
      account.withdraw(200.0);
      expect(account.balance, equals(800.0));
    });

    test('Não deve sacar se o valor for maior que o saldo', () {
      Account<String> account = Account('Carlos', 500.0);
      account.withdraw(600.0);
      expect(account.balance, equals(500.0)); // O saldo permanece o mesmo
    });
  });
}
