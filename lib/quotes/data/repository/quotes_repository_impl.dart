
import 'package:my_network_practice/quotes/data/models/quote.dart';
import 'package:my_network_practice/quotes/domain/repository/QuotesRepository.dart';
import 'package:my_network_practice/shared/result.dart';

import '../api/quotes_api.dart';

class QuotesRepositoryImpl extends QuotesRepository {
  final QuotesApi quotesApi;

  QuotesRepositoryImpl({required this.quotesApi});

  @override
  Future<Result<List<Quote>>> fetchQuotes() async {
    try {
      final quotes = await quotesApi.fetchQuotes();
      return Result.success(quotes);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

}