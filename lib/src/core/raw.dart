part of dev.alchemica.gnomi.core;

class WalletRawConverter extends JsonConverter<Wallet, String> {
  const WalletRawConverter();

  @override
  Wallet fromJson(String raw) => Wallet(raw);

  @override
  String toJson(Wallet wallet) => wallet.address;
}

class ByteListRawConverter extends JsonConverter<List<int>, String> {
  const ByteListRawConverter();

  @override
  List<int> fromJson(String raw) => raw
      .split('-')
      .map<int>((byte) => int.parse(byte, radix: 16))
      .toList(growable: false);

  @override
  String toJson(List<int> bytes) =>
      bytes.map<String>((byte) => byte.toRadixString(16)).join('-');
}
