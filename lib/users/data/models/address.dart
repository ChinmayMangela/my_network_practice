class Address {
  final String? address;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? state;
  final String? stateCode;

  const Address({
    required this.address,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.state,
    required this.stateCode,
  });

  String getFormattedAddress() {
    return '$address, $city, $state $postalCode, $country';
  }

  factory Address.fromJson(Map<String, dynamic> addressData) {
    return Address(
      address: addressData['address'] ?? 'Unknown',
      city: addressData['city'] ?? 'Unknown',
      country: addressData['country'] ?? 'Unknown',
      postalCode: addressData['postalCode'] ?? 'Unknown',
      state: addressData['state'] ?? 'Unknown',
      stateCode: addressData['stateCode'] ?? 'Unknown',
    );
  }
}
