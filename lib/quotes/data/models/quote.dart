class Quote {
  final String? quote;
  final String? author;

  const Quote({
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> quotesData) {
    return Quote(
      quote: quotesData['quote'],
      author: quotesData['author'],
    );
  }
}
