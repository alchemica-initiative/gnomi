part of dev.alchemica.gnomi.security.vault;

@immutable
class KeyRecord {
  final PublicKey key;

  KeyRecord(this.key);
}

class OwnedKeyRecord extends KeyRecord {
  final KeyPair keyPair;

  OwnedKeyRecord({
    required this.keyPair,
    required PublicKey publicKey,
  }) : super(publicKey);
}
