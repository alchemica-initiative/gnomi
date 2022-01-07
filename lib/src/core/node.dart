part of dev.alchemica.gnomi.core;

abstract class GnomiNode extends Wallet {
  GnomiNode(String address) : super(address);

  bool send({
    required Wallet from,
    required Wallet to,
    double amount = 0,
    double fee = 1,
    dynamic data,
  });

  Transaction? fetchTransaction(String id);
}
