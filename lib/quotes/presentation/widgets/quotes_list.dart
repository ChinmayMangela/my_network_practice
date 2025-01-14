import 'package:flutter/material.dart';
import 'package:my_network_practice/quotes/presentation/widgets/quote_tile.dart';

import '../../data/models/quote.dart';

class QuotesList extends StatelessWidget {
  const QuotesList({
    super.key,
    required this.quotes,
  });

  final List<Quote> quotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      final currentQuote = quotes[index];
      return QuoteTile(
        quote: currentQuote,
      );
    }, itemCount: quotes.length,);
  }
}
