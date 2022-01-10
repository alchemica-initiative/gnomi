part of dev.alchemica.gnomi.security.vault;

class KeyVault {
  final Map<String, KeyRecord> _records = {};

  void addAll(Map<String, KeyRecord> records) => _records.addAll(records);

  void dropAll() => _records.clear();

  KeyRecord? forWallet(Wallet wallet) => _records[wallet.address];

  OwnedKeyRecord? ownedForWallet(Wallet wallet) {
    final KeyRecord? record = forWallet(wallet);
    if (record is OwnedKeyRecord) return record;
  }

  void assign(Wallet wallet, KeyRecord record) =>
      _records[wallet.address] = record;
}
