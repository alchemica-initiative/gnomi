part of dev.alchemica.gnomi.security.vault;

abstract class KeyVaultRepository {
  final String? password;

  KeyVaultRepository([this.password]);

  Future<void> store(Map<String, KeyRecord> records);

  Future<Map<String, KeyRecord>> retrieve();
}
