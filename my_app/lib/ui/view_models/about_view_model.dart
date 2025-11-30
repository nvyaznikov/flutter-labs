import 'package:flutter/foundation.dart';
import '../../data/models/quote.dart';
import '../../data/services/quote_service.dart';

class AboutViewModel with ChangeNotifier {
  final QuoteService _quoteService;
  Quote? _currentQuote;
  bool _isLoading = false;
  String? _error;

  AboutViewModel(this._quoteService);

  Quote? get currentQuote => _currentQuote;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadRandomQuote() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _currentQuote = await _quoteService.getRandomQuote();
    } catch (e) {
      _error = 'Не удалось загрузить цитату';
      if (kDebugMode) {
        print('Error loading quote: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}