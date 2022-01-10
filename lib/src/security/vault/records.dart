part of dev.alchemica.gnomi.security.vault;

@immutable
@JsonSerializable()
class KeyRecord {
  @PublicKeyRawConverter()
  final PublicKey publicKey;

  KeyRecord(this.publicKey);

  factory KeyRecord.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$KeyRecordFromJson(json);

  Map<String, dynamic> toJson() => _$KeyRecordToJson(this);
}

@JsonSerializable()
class OwnedKeyRecord extends KeyRecord {
  @KeyPairRawConverter()
  final KeyPair keyPair;

  OwnedKeyRecord({
    required this.keyPair,
    required PublicKey publicKey,
  }) : super(publicKey);

  factory OwnedKeyRecord.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OwnedKeyRecordFromJson(json);

  Map<String, dynamic> toJson() => _$OwnedKeyRecordToJson(this);
}
