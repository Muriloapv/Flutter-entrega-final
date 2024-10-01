import '../lib/main.dart'; // Importa o arquivo onde está a ContaBancaria
import '../test/conta_bancaria_teste.dart'
void main() {
  group('Teste da ContaBancaria', () {
    test('Depositar valor', () {
      var conta = ContaBancaria<double>(1000.00);
      conta.depositar(500.00);
      expect(conta.obterSaldo(), equals(1500.00));
    });

    test('Sacar valor com saldo suficiente', () {
      var conta = ContaBancaria<double>(1000.00);
      conta.sacar(500.00);
      expect(conta.obterSaldo(), equals(500.00));
    });

    test('Sacar valor com saldo insuficiente', () {
      var conta = ContaBancaria<double>(1000.00);
      conta.sacar(1500.00); // Tentativa de saque maior que o saldo
      expect(conta.obterSaldo(), equals(1000.00)); // O saldo não deve mudar
    });
  });
}
