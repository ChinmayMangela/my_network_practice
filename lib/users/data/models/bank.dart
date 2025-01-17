class Bank {
  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  const Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  factory Bank.fromJson(Map<String, dynamic> bankData) {
    return Bank(
      cardExpire: bankData['cardExpire'] ?? 'Unknown',
      cardNumber: bankData['cardNumber'] ?? 'Unknown',
      cardType: bankData['cardType'] ?? 'Unknown',
      currency: bankData['currency'] ?? 'Unknown',
      iban: bankData['iban'] ?? 'Unknown',
    );
  }
}
