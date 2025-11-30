import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote.dart';

class QuoteService {
  static const String _baseUrl = 'https://api.quotable.io';

  Future<Quote> getRandomQuote() async {
    final response = await http.get(Uri.parse('$_baseUrl/random'));
    
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Quote.fromJson(jsonData);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}