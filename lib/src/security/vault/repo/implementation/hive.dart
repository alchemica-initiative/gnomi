part of dev.alchemica.gnomi.security.vault;

@Injectable(as: KeyVaultRepository)
class HiveKeyVaultRepositoryFactory extends KeyVaultRepositoryFactory {
  @override
  KeyVaultRepository create([String? password]) =>
      HiveKeyVaultRepository(password);
}

class HiveKeyVaultRepository extends KeyVaultRepository {
  static const String _kRemoteBoxName = 'gnomi-key-vault-remote';
  static const String _kOwnedBoxName = 'gnomi-key-vault-owned';

  HiveKeyVaultRepository([String? password]) : super(password);

  @override
  Future<Map<String, KeyRecord>> retrieve() async {
    Box remoteBox = await _openBox(_kRemoteBoxName);
    Box ownedBox = await _openBox(_kOwnedBoxName);

    Map<String, Map<String, dynamic>> rawRemote = await _extractRaw(remoteBox);
    Map<String, Map<String, dynamic>> rawOwned = await _extractRaw(ownedBox);

    return {
      ...rawRemote.map(
        (key, value) => MapEntry(
          key,
          KeyRecord.fromJson(value),
        ),
      ),
      ...rawOwned.map(
        (key, value) => MapEntry(
          key,
          OwnedKeyRecord.fromJson(value),
        ),
      ),
    };
  }

  Future<Map<String, Map<String, dynamic>>> _extractRaw(Box box) async {
    final Map<String, Map<String, dynamic>> result = {};

    Map rawDynamic = box.toMap();
    for (MapEntry entry in rawDynamic.entries)
      if (entry.key is String && entry.value is Map<String, dynamic>)
        result[entry.key] = entry.value;

    return result;
  }

  @override
  Future<void> store(Map<String, KeyRecord> records) async {
    final Box remoteBox = await _openBox(_kRemoteBoxName);
    final Box ownedBox = await _openBox(_kOwnedBoxName);

    final Map<String, Map<String, dynamic>> rawOwned = {};
    final Map<String, Map<String, dynamic>> rawRemote = {};

    for (MapEntry<String, KeyRecord> entry in records.entries)
      if (entry.value is OwnedKeyRecord)
        rawOwned[entry.key] = entry.value.toJson();
      else
        rawRemote[entry.key] = entry.value.toJson();

    await remoteBox.putAll(rawRemote);
    await ownedBox.putAll(rawOwned);
  }

  @override
  Future<void> reset() async {
    await Hive.deleteBoxFromDisk(_kRemoteBoxName);
    await Hive.deleteBoxFromDisk(_kOwnedBoxName);
  }

  Future<Box> _openBox(String name) async {
    HiveCipher? cipher;

    if (password is String) {
      Hash passwordHash = await Sha256().hash(utf8.encode(password!));
      cipher = HiveAesCipher(passwordHash.bytes);
    }

    return Hive.openBox(name, encryptionCipher: cipher);
  }
}
