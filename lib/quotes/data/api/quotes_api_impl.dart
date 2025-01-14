
import 'dart:convert';

import 'package:my_network_practice/quotes/data/api/quotes_api.dart';
import 'package:my_network_practice/quotes/data/models/quote.dart';
import 'package:http/http.dart' as http;

class QuotesApiImpl extends QuotesApi {
  
  @override
  Future<List<Quote>> fetchQuotes() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/quotes'));

      if(response.statusCode == 200) {
        final quoteData = jsonDecode(response.body);
        final List<dynamic> quotes = quoteData['quotes'];
        return quotes.map((quote) => Quote.fromJson(quote)).toList();
      } else {
        throw Exception('Failed to fetch quotes');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
}