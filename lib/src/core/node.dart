part of dev.alchemica.gnomi.core;

abstract class GnomiNode extends Wallet {
  GnomiNode(String address) : super(address);

  bool commit({
    required Wallet from,
    required Wallet to,
    double amount = 0,
    double fee = 1,
    dynamic data,
  });

  List<Block> add(List<Block> blocks);

  Transaction? fetchTransaction(String id);

  Block? fetchBlock(String id);
}
