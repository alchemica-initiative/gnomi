// GENERATED CODE - DO NOT MODIFY BY HAND

part of dev.alchemica.gnomi.security.vault;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyRecord _$KeyRecordFromJson(Map<String, dynamic> json) => KeyRecord(
      const PublicKeyRawConverter()
          .fromJson(json['publicKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KeyRecordToJson(KeyRecord instance) => <String, dynamic>{
      'publicKey': const PublicKeyRawConverter().toJson(instance.publicKey),
    };

OwnedKeyRecord _$OwnedKeyRecordFromJson(Map<String, dynamic> json) =>
    OwnedKeyRecord(
      keyPair: const KeyPairRawConverter()
          .fromJson(json['keyPair'] as Map<String, dynamic>),
      publicKey: const PublicKeyRawConverter()
          .fromJson(json['publicKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OwnedKeyRecordToJson(OwnedKeyRecord instance) =>
    <String, dynamic>{
      'publicKey': const PublicKeyRawConverter().toJson(instance.publicKey),
      'keyPair': const KeyPairRawConverter().toJson(instance.keyPair),
    };
