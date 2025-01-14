import 'package:flutter/material.dart';
import 'package:my_network_practice/quotes/data/models/quote.dart';

class QuoteTile extends StatelessWidget {
  const QuoteTile({
    super.key,
    required this.quote,
  });

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(quote.quote!),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('- ${quote.author!}'),
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
