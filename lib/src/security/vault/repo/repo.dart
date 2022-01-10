part of dev.alchemica.gnomi.security.vault;

abstract class KeyVaultRepository {
  void store(Map<String, KeyRecord> records);

  Map<String, KeyRecord> retrieve();
}
