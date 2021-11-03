import 'package:dio/dio.dart';

import 'package:gces_social/app/data/api/suggestion/suggestion_api.dart';

import '../models/suggestion.dart';

class SuggestionRepository {
  final Dio _dio;

  SuggestionRepository(this._dio);

  Future<dynamic> postSuggestion(Suggestion suggestion) async {
    return await SuggestionApi(_dio).postSuggestion(suggestion);
  }
}
