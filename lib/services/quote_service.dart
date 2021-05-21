import 'package:dio/dio.dart';
import 'package:flutter_simple_mvvm_architecture/core/constants/api_constants.dart';
import 'package:flutter_simple_mvvm_architecture/models/quote_model.dart';

class QuoteService {
  QuoteService._();
  static final instance = QuoteService._();

  final url = ApiConstants.BASE_URL + ApiConstants.PATH_RANDOM_3;

  Future<QuoteModel> getQuotes() async {
    final response = await Dio().get(url);
    return QuoteModel.fromJson(response.data);
  }
}
