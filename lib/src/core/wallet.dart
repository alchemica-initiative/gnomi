part of dev.alchemica.gnomi.core;

@immutable
class Wallet {
  final String address;

  Wallet(this.address)
      : assert(
          Uuid.isValidUUID(fromString: address),
          'Address shall be valid UUID string!',
        );

  factory Wallet.create() => Wallet(Uuid().v4());
}
