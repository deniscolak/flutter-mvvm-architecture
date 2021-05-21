import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_mvvm_architecture/services/quote_service.dart';

final quoteProvider = FutureProvider.autoDispose((_) {
  final quoteService = QuoteService.instance;
  return quoteService.getQuotes();
});
