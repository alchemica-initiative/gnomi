part of dev.alchemica.gnomi.security.vault;

class PublicKeyRawConverter
    extends JsonConverter<PublicKey, Map<String, dynamic>> {
  const PublicKeyRawConverter();

  @override
  PublicKey fromJson(Map<String, dynamic> json) =>
      Jwk.fromJson(json).toPublicKey()!;

  @override
  Map<String, dynamic> toJson(PublicKey object) =>
      Jwk.fromPublicKey(object).toJson();
}

class KeyPairRawConverter extends JsonConverter<KeyPair, Map<String, dynamic>> {
  const KeyPairRawConverter();

  @override
  KeyPair fromJson(Map<String, dynamic> json) => Jwk.fromJson(json).toKeyPair();

  @override
  Map<String, dynamic> toJson(KeyPair object) =>
      Jwk.fromKeyPair(object).toJson();
}
