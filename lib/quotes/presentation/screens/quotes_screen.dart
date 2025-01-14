import 'package:flutter/material.dart';
import 'package:my_network_practice/quotes/data/api/quotes_api_impl.dart';
import 'package:my_network_practice/quotes/presentation/widgets/quotes_list.dart';
import 'package:my_network_practice/shared/result.dart';

import '../../data/repository/quotes_repository_impl.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final quotesRepository = QuotesRepositoryImpl(quotesApi: QuotesApiImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return FutureBuilder(
        future: quotesRepository.fetchQuotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final result = snapshot.data;
            if (result!.state == ResultState.success) {
              return QuotesList(quotes: result.data!);
            } else {
              return Center(
                child: Text(result.message!),
              );
            }
          } else {
            return Center(
              child: Text('Something went wrong'),
            );
          }
        });
  }
}
