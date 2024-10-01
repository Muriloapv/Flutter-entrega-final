import 'bank/account.dart';
import 'bank/transaction.dart';

void main() {
  // Criando contas de diferentes tipos
  Account<String> account1 = Account('João', 1000.0);
  Account<String> account2 = Account('Maria', 500.0);

  // Exibindo saldos iniciais
  print('Saldo de ${account1.accountHolder}: ${account1.balance}');
  print('Saldo de ${account2.accountHolder}: ${account2.balance}');

  // Criando uma transação entre as contas
  Transaction<Account<String>> transaction = Transaction(
    sender: account1,
    receiver: account2,
    amount: 200.0,
  );

  // Executando a transação
  transaction.executeTransaction();

  // Exibindo saldos após a transação
  print(
      'Saldo de ${account1.accountHolder} após a transação: ${account1.balance}');
  print(
      'Saldo de ${account2.accountHolder} após a transação: ${account2.balance}');
}
