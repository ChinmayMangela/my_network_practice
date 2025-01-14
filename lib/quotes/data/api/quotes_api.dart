

import '../models/quote.dart';

abstract class QuotesApi {

  Future<List<Quote>> fetchQuotes();
}