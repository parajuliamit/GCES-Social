import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/suggestion.dart';

part 'suggestion_api.g.dart';

@RestApi()
abstract class SuggestionApi {
  factory SuggestionApi(Dio dio) = _SuggestionApi;

  @POST("suggestions/create/")
  Future<dynamic> postSuggestion(@Body() Suggestion suggestion);
}
