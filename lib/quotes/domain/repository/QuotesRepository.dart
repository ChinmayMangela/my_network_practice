import '../../../shared/result.dart';
import '../../data/models/quote.dart';

abstract class QuotesRepository {

  Future<Result<List<Quote>>> fetchQuotes();
}