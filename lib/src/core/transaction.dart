part of dev.alchemica.gnomi.core;

@immutable
@JsonSerializable()
class Transaction {
  final String id;

  @WalletRawConverter()
  final Wallet sender;

  @WalletRawConverter()
  final Wallet receiver;

  final double amount;

  final double fee;

  final dynamic data;

  @ByteListRawConverter()
  final List<int> signature;

  Transaction({
    String? id,
    required this.sender,
    required this.receiver,
    required this.signature,
    this.amount = 0,
    this.fee = 1,
    this.data,
  }) : id = id ?? Uuid().v4();

  factory Transaction.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  Map<String, dynamic> rawNoSignature() => toJson()..remove('signature');
}
