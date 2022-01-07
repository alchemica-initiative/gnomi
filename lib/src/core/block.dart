part of dev.alchemica.gnomi.core;

@immutable
@JsonSerializable()
class BlockConfirmation {
  @WalletRawConverter()
  final Wallet confirmer;

  @ByteListRawConverter()
  final List<int> signature;

  const BlockConfirmation({
    required this.confirmer,
    required this.signature,
  });

  factory BlockConfirmation.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BlockConfirmationFromJson(json);

  Map<String, dynamic> toJson() => _$BlockConfirmationToJson(this);
}

@immutable
@JsonSerializable()
class Block {
  final String id;

  final String parentId;

  final List<Transaction> included;

  final List<BlockConfirmation> confirmations;

  const Block({
    required this.id,
    required this.parentId,
    required this.included,
    required this.confirmations,
  });

  factory Block.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BlockFromJson(json);

  Map<String, dynamic> toJson() => _$BlockToJson(this);

  Map<String, dynamic> get rawNoConfirmations =>
      toJson()..remove('confirmations');
}
