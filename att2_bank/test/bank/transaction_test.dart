import 'package:test/test.dart';
import '../../lib/bank/account.dart';
import '../../lib/bank/transaction.dart';

void main() {
  group('Transaction', () {
    test('Deve realizar a transação corretamente', () {
      Account<String> sender = Account('João', 1000.0);
      Account<String> receiver = Account('Maria', 500.0);

      Transaction<Account<String>> transaction = Transaction(
        sender: sender,
        receiver: receiver,
        amount: 200.0,
      );

      transaction.executeTransaction();

      expect(sender.balance, equals(800.0));
      expect(receiver.balance, equals(700.0));
    });

    test('Não deve realizar transação se o saldo for insuficiente', () {
      Account<String> sender = Account('João', 100.0);
      Account<String> receiver = Account('Maria', 500.0);

      Transaction<Account<String>> transaction = Transaction(
        sender: sender,
        receiver: receiver,
        amount: 200.0,
      );

      transaction.executeTransaction();

      expect(sender.balance, equals(100.0)); // Sem alteração no saldo
      expect(receiver.balance, equals(500.0));
    });
  });
}
